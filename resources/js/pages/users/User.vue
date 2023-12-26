<script setup>
import { ref } from 'vue';
import AddUser from "./AddUser.vue";
import { onMounted } from "@vue/runtime-core";
import axios from "axios";
import { toast } from "vue3-toastify";
const isEdit = ref(false);
const user = ref({});
const Users = ref([]);
const page = ref(1);
const notify = (message) => {
  toast.success(message, {
    autoClose: 3000,
    position: toast.POSITION.TOP_CENTER,
  });
};
const notifyError = (message) => {
  toast.error(message, {
    autoClose: 3000,
    position: toast.POSITION.TOP_CENTER,
  });
};
const userEdit = (userSelect) => {
  isEdit.value = true;
  user.value = userSelect;
};
const addUser = () => {
  isEdit.value = true;
  user.value = false;
};
const getUsers= (page) =>{
    axios.get(`index-users?page=${page}`).then((res) => {
        Users.value = res.data.users.data;

    });
}
const goBack = (event) => {
  isEdit.value = event;
  user.value = false;
  getUsers(page);
};
onMounted(() => {
    getUsers(page);
});
</script>
<template>
  <div>
    <AddUser v-if="isEdit"  @goBack="goBack($event)" :user="user" />
    <div v-if="!isEdit" class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-header">
        <h4 class="card-title" >{{ $t('table') }} {{ $t('users') }} </h4>
        <button
          class="btn btn-primary btn-circle btn-sm float-end"
          @click="addUser"
        >
            <i class="fas fa-plus"></i>
        </button>
      </div>
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-bordered text-center" width="100%">
            <thead>
              <tr>
                <th>{{ $t('actions') }}</th>
                <th>{{ $t('id') }}</th>
                <th>{{ $t('name') }}</th>
                <th>{{ $t('email') }}</th>
                <th>{{ $t('mobile') }}</th>
                <th>{{ $t('name_role') }}</th>
              </tr>
            </thead>
            <tfoot></tfoot>
            <tbody>
              <tr v-for="user in Users" :key="user.id">
                <td>
                  <button hidden class="btn btn-danger btn-circle btn-sm m-1">
                    <i class="fas fa-trash"></i>
                  </button>
                  <button @click="userEdit(user)" class="btn btn-info btn-circle btn-sm">
                    <i class="fas fa-edit"></i>
                  </button>
                </td>
                <td>
                    {{ user.id }}
                </td>
                <td>
                    {{ user.name }}
                </td>
                <td>
                    {{ user.email }}
                </td>
                <td>
                    {{ user.mobile }}
                </td>
                <td>
                    {{ user.role?.name_role }}
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>
