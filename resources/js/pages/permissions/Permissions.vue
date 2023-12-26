<script setup>
import { ref } from 'vue';
import { onMounted } from "@vue/runtime-core";
import axios from "axios";
import { toast } from "vue3-toastify";
const isEdit = ref(false);
const permission = ref({});
const Permissions = ref([]);
const role_id = ref(0);
const Roles = ref([]);
const Pages = ref([]);
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
const getPermissions= () =>{
    axios.get(`get-permissions/${role_id.value}`).then((res) => {
        Permissions.value = res.data.permissions;
        // notify(res.data.message);
    });
}
const getPermission= (page_id,role_id,per) =>{
let permission = Permissions.value.find(
    permission => permission.page_id === page_id
    && permission.role_id === role_id
    && permission[per] === 1
    );
    if(permission){
        return true;
    }else{
        return false;
    }
}
const getRoles= () =>{
    axios.get(`get-roles`).then((res) => {
        Roles.value = res.data.roles;
        // notify(res.data.message);
    });
}
const getPages= () =>{
    axios.get(`get-pages`).then((res) => {
        Pages.value = res.data.pages;
        // notify(res.data.message);
    });
}
const updatePermission = (page_id,role_id,permission,event)=>{
    if(role_id==0){
        toast.error('Please select role', {
            autoClose: 500,
            position: toast.POSITION.TOP_CENTER,
          });
          return false;
    }
    axios.post(`update-permission`,{
        page_id:page_id,
        role_id:role_id,
        permission:permission,
        event:event
    }).then((res) => {
        if(res.data.status==401){
            toast.error(res.data.message, {
                autoClose: 3000,
                position: toast.POSITION.TOP_CENTER,
              });
              return false;
        }
        toast.success(res.data.message, {
    autoClose: 100,
    position: toast.POSITION.TOP_CENTER,
  });
    }).catch((err) => {
        notifyError(err.response.data.message);
    });
}
onMounted( async () => {
   await getRoles();
    await getPages();
   await getPermissions();
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
    <div v-if="!isEdit" class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-header">
        <h4 class="card-title" >
            <div  >
            <select  v-model="role_id" class="form-control " @change="getPermissions"   >
                <option value="0">{{ $t('Select Role') }}</option>
                <option v-for="role in Roles" :key="role.id" :value="role.id">{{ role.name_role }}</option>
              </select>
            </div>
        </h4>
        <h4 class="card-title" >  {{ $t('table') }} {{ $t('permissions') }}</h4>
      </div>
      <div class="card-body p-0">
        <div class="table-responsive">
          <table v-if="role_id!=0" class="table table-bordered text-center" width="100%">
            <thead>
              <tr>
                <th>{{ $t('page') }}</th>
                <th>{{ $t('read') }}</th>
                <th>{{ $t('edit') }}</th>
                <th>{{ $t('create') }}</th>
                <th>{{ $t('update') }}</th>
                <th>{{ $t('delete') }}</th>
              </tr>
            </thead>
            <tfoot></tfoot>
            <tbody>
              <tr v-for="page in Pages" :key="page.id">
                <td>
                    {{ $t(page.page) }}
                </td>
                <td>
                <input type="checkbox"
                :disabled="!chickPermission('permissions','update') "
                 :checked="getPermission(page.id,role_id,'read')"
                 @change="updatePermission(page.id,role_id,'read',$event.target.checked)"
                  >
                </td>
                <td>
                <input type="checkbox"
                :disabled="!chickPermission('permissions','update') "
                :checked="getPermission(page.id,role_id,'edit')"
                @change="updatePermission(page.id,role_id,'edit',$event.target.checked)"
                 >
                </td>
                <td>
                <input type="checkbox"
                :disabled="!chickPermission('permissions','update') "
                :checked="getPermission(page.id,role_id,'create')"
                @change="updatePermission(page.id,role_id,'create',$event.target.checked)"
                 >
                </td>
                <td>
                <input type="checkbox"
                :disabled="!chickPermission('permissions','update') "
                 :checked="getPermission(page.id,role_id,'update')"
                @change="updatePermission(page.id,role_id,'update',$event.target.checked)"
                 >
                </td>
                <td>
                <input type="checkbox"
                :disabled="!chickPermission('permissions','update') "
                 :checked="getPermission(page.id,role_id,'delete')"
                @change="updatePermission(page.id,role_id,'delete',$event.target.checked)"
                 >
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>
