<script setup>
import { ref } from 'vue'
import   photoComponent from  '@/components/photoComponent.vue'
import {toast} from "vue3-toastify"
const result  = ref(false)
const props = defineProps([
    "user"]
)
const notify = (message) => {
    toast.success(message,
    {
        autoClose: 3000,
        position: toast.POSITION.TOP_CENTER
    }
    );
}
const notifyError = (message) => {
    toast.error(message,
    {
        autoClose: 3000,
        position: toast.POSITION.TOP_CENTER
    }
    );
}
const UserUpdate = () => {
    if (props.user.name === '' || props.user.email === '' ) {
        notifyError('Please fill all fields');
       } else {
    axios.post('/user-update', {
        name: props.user.name,
        father_name: props.user.father_name,
        date_of_birth: props.user.date_of_birth,
        mobile: props.user.mobile,
        email: props.user.email,
    }).then((res) => {
        notify(res.data.message)
    }).catch((err) => {
        notifyError(err.response.data.message)
    })
}
}
const deletePhoto=(id)=> {
    axios.post('/delete-photo', {
        id: id
    }).then((res) => {
        notify(res.data.message)
        window.location.reload()
    }).catch((err) => {
        notifyError(err.response.data.message)
    })
}
const selectPhoto=(id)=> {
    axios.post('/select-photo', {
        id: id
    }).then((res) => {
        notify(res.data.message)
        window.location.reload()
    }).catch((err) => {
        notifyError(err.response.data.message)
    })
}
const submitFile = (file) => {
     result.value = false
    let formData = new FormData();
    formData.append('file', file);
    formData.append('id', props.user.id);
    axios.post('profile-upload', formData, {
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    }).then((res) => {
        props.user.photo = res.data.path
        result.value = true
        notify(res.data.message)
    }).catch((err) => {
        result.value = false
        notifyError(err.response.data.message)
    })
}
</script>
<template>
<div class="card o-hidden border-0 shadow-lg my-5">
    <div class="card-body p-0"  >
        <!-- Nested Row within Card Body -->
        <div class="row">
            <div class="col-lg-8">
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4">{{ $t('profile') }}</h1>
                    </div>
                    <form class="user">
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="inputName" class="form-label">{{ $t('name') }}</label>
                                <input type="text" v-model="props.user.name" class="form-control form-control-user" id="exampleName"
                                    placeholder="  Name">
                            </div>
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                 <label for="inputFatherName" class="form-label">{{ $t('father name') }}</label>
                                <input type="text" v-model="props.user.father_name" class="form-control form-control-user" id="father_name"
                                    placeholder="  father_name">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="inputDateOfBirth" class="form-label">{{ $t('date of birth') }}</label>
                                <input type="number" v-model="props.user.date_of_birth" class="form-control form-control-user" id="date_of_birth"
                                    placeholder="  date_of_birth">
                            </div>
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                 <label for="inputMobile" class="form-label">{{ $t('mobile') }}</label>
                                <input type="number" v-model="props.user.mobile" class="form-control form-control-user" id="mobile"
                                    placeholder="  mobile">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="form-label">{{ $t('email') }}</label>
                            <input type="email" v-model="props.user.email" class="form-control form-control-user" id="exampleInputEmail"
                                placeholder="Email Address">
                        </div>
                        <div class="mt-2">
                        <a @click="UserUpdate()" class="btn btn-primary btn-user btn-block">
                            {{ $t('update') }}
                        </a>
                    </div>
                    </form>
                    <hr>
                    <div class="text-center">
                        <router-link
                            class="btn btn-danger"
                            to="/reset-password-form-sent"
                        >
                        {{ $t('change password') }}
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
        <div class="col-12">
        <div class="card pb-5 ">
         <photoComponent
         class="m-auto"
         @isEmit="submitFile($event)"
         :result="result"
           />
           <div class="table-responsive">
            <table class="table table-bordered text-center"   width="100%"  >
                <thead>
                 <tr>
                    <th  >{{ $t('actions') }}</th>
                    <th  >{{ $t('photo') }}</th>
                 </tr>
                </thead>
                <tfoot>
                </tfoot>
                <tbody>
                    <tr v-for="photo in props.user.photos" :key="photo.id" >
                        <td>
                            <button v-if="photo.name != props.user.photo"
                            @click="deletePhoto(photo.id)"
                            class="btn btn-danger btn-circle btn-sm m-1" >
                                <i class="fas fa-trash"></i>
                            </button>
                            <button
                            @click="selectPhoto(photo.id)"
                             v-if="photo.name != props.user.photo" class="btn btn-info btn-circle btn-sm" >
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                        <td>
                            <img :src="`images/user/${photo.name}`"
                                class="img-fluid rounded-circle"
                                alt="avatar"
                                width="40" height="40" />
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>
        </div>
        </div>
        </div>
    </div>
</div>
</template>
