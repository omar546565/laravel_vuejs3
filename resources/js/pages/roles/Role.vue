<script setup>
import { ref } from 'vue';
import RoleAdd from "./RoleAdd.vue";
import { onMounted } from "@vue/runtime-core";
import axios from "axios";
import { toast } from "vue3-toastify";
const isEdit = ref(false);
const role = ref({});
const Roles = ref([]);
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
const roleEdit = (roleSelect) => {
  isEdit.value = true;
  role.value = roleSelect;
};
const addRole = () => {
  isEdit.value = true;
  role.value = false;
};
const getRoles= () =>{
    axios.get(`get-roles`).then((res) => {
        Roles.value = res.data.roles;

    });
}
const goBack = (event) => {
  isEdit.value = event;
  role.value = false;
  getRoles(role);
};
onMounted(() => {
    getRoles();
});
const perUser = ref(JSON.parse(localStorage.getItem("perUser")));
const chickPermission=(page,per)=>{
    let permission = perUser.value.find(
        permission => permission.page.page === page
        && permission[per] === 1
        );
        if(permission){
            return true;
        }else{
            return false;
        }
}
</script>
<template>
  <div>
    <RoleAdd v-if="isEdit"  @goBack="goBack($event)" :role="role" />
    <div v-if="!isEdit" class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-header">
        <h4 class="card-title" >{{ $t('table') }} {{ $t('roles') }} </h4>
        <button
         v-if="chickPermission('roles','create')"
          class="btn btn-primary btn-circle btn-sm float-end"
          @click="addRole"
        >
            <i class="fas fa-plus"></i>
        </button>
      </div>
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-bordered text-center" width="100%">
            <thead>
              <tr>
                <th
                v-if="chickPermission('roles','delete') || chickPermission('roles','edit')"
                >{{ $t('actions') }}</th>
                <th>{{ $t('id') }}</th>
                <th>{{ $t('name') }}</th>
                <th>{{ $t('delete') }}</th>
              </tr>
            </thead>
            <tfoot></tfoot>
            <tbody>
              <tr v-for="role in Roles" :key="role.id">
                <td  v-if="chickPermission('roles','delete') || chickPermission('roles','edit')" >
                    <button
                  v-if="chickPermission('roles','edit')"
                   @click="roleEdit(role)"
                  class="btn btn-info btn-circle btn-sm">
                    <i class="fas fa-edit"></i>
                  </button>


                </td>
                <td>
                    {{ role.id }}
                </td>
                <td>
                    {{ role.name_role }}
                </td>
                <td>
                    <button
                  v-if="chickPermission('roles','delete')"
                   class="btn btn-danger btn-circle btn-sm m-1">
                    <i class="fas fa-trash"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>
