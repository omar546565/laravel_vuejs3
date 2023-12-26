<script setup
>
import { ref } from 'vue';
const errors = ref([]);
const password = ref('');
const password_confirmation = ref('');
const confirmPass = () => {
    if (password.value !== password_confirmation.value) {
        alert('Password not match');
    }
};
const ResetPass = () => {
    if (password.value === '' || password_confirmation.value === '') {
        alert('Please fill all fields');
    } else {
        axios.post('/reset-pass', {
            password: password.value,
            password_confirmation: password_confirmation.value
        }).then((res) => {
            alert(res.data.message)
     window.location.href = '/admin'
        }).catch((err) => {
            console.log(err);
        });
    }
};
</script>
<template>
  <router-link
                            class="btn btn-info"
                            to="/profile"
                        >
                        {{ $t('back profile') }}
                        </router-link>
      <!-- Outer Row -->
      <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
          <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
              <!-- Nested Row within Card Body -->
              <div class="row">
                <div class="col-lg-6 d-none d-lg-block bg-pass-image"></div>
                <div class="col-lg-6">
                  <div class="p-5">
                    <div class="text-center">
                      <h1 class="h4 text-gray-900 mb-4">{{ $t('reset Password Form') }}</h1>
                      <h1 v-if="errors.length>0" class="h4 text-danger mb-4">{{ errors }}</h1>
                    </div>
                    <form class="user">
                      <div class="form-group row">
                              <div class="col-sm-6 mb-3 mb-sm-0">
                                  <input type="password" v-model="password" class="form-control form-control-user"
                                      id="exampleInputPassword" placeholder="Password">
                              </div>
                              <div class="col-sm-6">
                                  <input type="password" @change="confirmPass()" v-model="password_confirmation" class="form-control form-control-user"
                                      id="exampleRepeatPassword" placeholder="Repeat Password">
                              </div>
                          </div>
                          <a @click="ResetPass()" class="btn btn-primary btn-user btn-block">
                              {{ $t('ResetPass') }}
                          </a>
                    </form>
                    <hr />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </template>
