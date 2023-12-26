<script setup>
import { ref } from "vue";
import { toast } from "vue3-toastify";
import { onMounted, watchEffect } from "@vue/runtime-core";
const emit = defineEmits(["goBack"]);
const props = defineProps(["user"]);
onMounted(async () => {
  await getRoles();
});
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
const id = ref("");
const name = ref("");
const email = ref("");
const father_name = ref("");
const date_of_birth = ref("");
const gender = ref("");
const mobile = ref("");
const password = ref("");
const password_confirmation = ref("");
const role_id = ref("");
const Roles = ref([]);
const getRoles = () => {
  axios.get("/get-roles").then((res) => {
    Roles.value = res.data.roles;
  });
};
const genders = ref([{ type: "ذكر" }, { type: "أنثى" }]);
const confirmPass = () => {
  if (password.value !== password_confirmation.value) {
    alert("Password not match");
  }
};
const goBack = () => {
  name.value = "";
  email.value = "";
  father_name.value = "";
  gender.value = "";
  date_of_birth.value = "";
  mobile.value = "";
  password.value = "";
  password_confirmation.value = "";
  emit("goBack", false);
};
const createUser = () => {
  if (
    (name.value === "" ||
      email.value === "" ||
      password.value === "" ||
      password_confirmation.value === "") &&
    !props.user
  ) {
    alert("Please fill all fields");
  } else if (name.value === "" || email.value === "") {
    alert("Please fill all fields");
  } else {
    axios
      .post("/create-user", {
        id: id.value,
        name: name.value,
        email: email.value,
        father_name: father_name.value,
        gender: gender.value,
        date_of_birth: date_of_birth.value,
        mobile: mobile.value,
        password: password.value,
        role_id: role_id.value,
        password_confirmation: password_confirmation.value,
      })
      .then((res) => {
        notify(res.data.message);
        emit("goBack", false);
        id.value = "";
        name.value = "";
        email.value = "";
        father_name.value = "";
        gender.value = "";
        date_of_birth.value = "";
        mobile.value = "";
        password.value = "";
        password_confirmation.value = "";
        role_id.value = "";
      })
      .catch((err) => {
        notifyError(err.response.data.message);
      });
  }
};
watchEffect(() => {
  if (props.user) {
    id.value = props.user.id;
    name.value = props.user.name;
    email.value = props.user.email;
    father_name.value = props.user.father_name;
    date_of_birth.value = props.user.date_of_birth;
    gender.value = props.user.gender;
    mobile.value = props.user.mobile;
    role_id.value = props.user.role_id;
  }
});
</script>
<template>
    <div class="card">
      <div class="card-body p-2">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="text-center">
            <h1 class="h4 text-gray-900 mb-2">
              {{ props.user ? $t("update") : $t("create") }}
            </h1>
          </div>
          <form class="row g-3">
            <div class="col-md-6">
               <label for="inputEmail4" class="form-label">{{ $t('name') }}</label>
                <input
                  type="text"
                  v-model="name"
                  class="form-control "
                  id="exampleName"
                  placeholder="  Name"
                />
            </div>
                <div class="col-md-6">
               <label for="inputEmail4" class="form-label">{{ $t('father name') }}</label>
                <input
                  type="text"
                  v-model="father_name"
                  class="form-control "
                  id="father_name"
                  placeholder="father_name"
                />
              </div>
              <div class="col-md-6">
               <label for="inputEmail4" class="form-label">{{ $t('gender') }}</label>
                <select class="form-control" v-model="gender">
                  <option
                    v-for="gender in genders"
                    :key="gender.type"
                    :value="gender.type"
                  >
                    {{ gender.type }}
                  </option>
                </select>
              </div>
              <div class="col-md-6">
               <label for="inputEmail4" class="form-label">{{ $t('role') }}</label>
                <select class="form-control" v-model="role_id">
                  <option v-for="Role in Roles" :key="Role.id" :value="Role.id">
                    {{ Role.name_role }}
                  </option>
                </select>
              </div>
              <div class="col-md-6">
                <label for="inputEmail4" class="form-label">{{ $t('date of birth') }}</label>
                <input
                  type="number"
                  v-model="date_of_birth"
                  class="form-control form-control-user"
                  id="date_of_birth"
                  placeholder="  date_of_birth"
                />
              </div>
              <div class="col-md-6">
                <label for="inputEmail4" class="form-label">{{ $t('mobile') }}</label>
                <input
                  type="number"
                  v-model="mobile"
                  class="form-control form-control-user"
                  id="mobile"
                  placeholder="  mobile"
                />
              </div>
              <div class="col-md-6">
                <label for="inputEmail4" class="form-label">{{ $t('email') }}</label>
              <input
                type="email"
                v-model="email"
                class="form-control form-control-user"
                id="exampleInputEmail"
                placeholder="Email Address"
              />
            </div>
            <div v-if="!props.user" class="form-group row">
                <div class="col-md-6">
                <label for="inputEmail4" class="form-label">{{ $t('password') }}</label>
                <input
                  type="password"
                  v-model="password"
                  class="form-control form-control-user"
                  id="exampleInputPassword"
                  placeholder="Password"
                />
              </div>
              <div class="col-md-6">
                <label for="inputEmail4" class="form-label">{{ $t('password_confirmation') }}</label>
                <input
                  type="password"
                  @change="confirmPass()"
                  v-model="password_confirmation"
                  class="form-control form-control-user"
                  id="exampleRepeatPassword"
                  placeholder="Repeat Password"
                />
              </div>
            </div>
            <div class="  row p-2">
              <div class="col-8">
                <a @click="createUser()" class="btn btn-primary btn-user btn-block m-1">
                  {{ props.user ? $t("update") : $t("create") }}
                </a>
              </div>
              <div class="col-4">
                <a @click="goBack()" class="btn btn-info btn-user btn-block m-1"> {{ $t('back') }} </a>
              </div>
            </div>
          </form>
          <hr />
        </div>
      </div>
  </div>
</template>
