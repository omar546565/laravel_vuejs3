<script setup>
import { ref } from 'vue'
const name = ref('')
const email = ref('')
const password = ref('')
const password_confirmation = ref('')
const confirmPass = () => {
    if (password.value !== password_confirmation.value) {
        alert('Password not match')
    }
}
const Register = () => {
    if (name.value === '' || email.value === '' || password.value === '' || password_confirmation.value === '') {
           alert('Please fill all fields');
       } else {
    axios.post('/register', {
        name: name.value,
        email: email.value,
        password: password.value,
        password_confirmation: password_confirmation.value
    }).then((res) => {
        localStorage.setItem('token', res.data.access_token)
        window.location.href = '/admin'
    }).catch((err) => {
        console.log(err)
    })
}
}
</script>
<template>
<div class="card o-hidden border-0 shadow-lg my-5">
    <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
            <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
            <div class="col-lg-7">
                <div class="p-5">
                    <div class="text-center">
                        <h1 class="h4 text-gray-900 mb-4">{{ $t('Create an Account!') }}</h1>
                    </div>
                    <form class="user">
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="inputName" class="form-label">{{ $t('name') }}</label>
                                <input type="text" v-model="name" class="form-control form-control-user" id="exampleName"
                                    placeholder="  Name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail" class="form-label">{{ $t('email') }}</label>
                            <input type="email" v-model="email" class="form-control form-control-user" id="exampleInputEmail"
                                placeholder="Email Address">
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <label for="inputPassword" class="form-label">{{ $t('password') }}</label>
                                <input type="password" v-model="password" class="form-control form-control-user"
                                    id="exampleInputPassword" placeholder="Password">
                            </div>
                            <div class="col-sm-6">
                                <input type="password" @change="confirmPass()" v-model="password_confirmation" class="form-control form-control-user"
                                    id="exampleRepeatPassword" placeholder="Repeat Password">
                            </div>
                        </div>
                        <a @click="Register()" class="btn btn-primary btn-user btn-block mt-1">
                            {{ $t('Register Account') }}
                        </a>
                    </form>
                    <hr>
                    <div class="text-center">
                        <a class="btn btn-info" href="/forgot-password">{{ $t('Forgot Password?') }}</a>
                    </div>
                    <div class="text-center">
                        <router-link
                            to="/login"
                        >
                        <a  class="btn btn-success m-1"  href="#">{{ $t('Already have an account? Login!') }}</a>
                        </router-link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>
