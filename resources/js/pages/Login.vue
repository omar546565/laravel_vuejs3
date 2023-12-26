<script setup>
import { ref } from "vue";
const email = ref("");
const password = ref("");
const Login = () => {
  if (email.value === "" || password.value === "") {
    alert("Please fill all fields");
  } else {
    axios
      .post("/login", {
        email: email.value,
        password: password.value,
      })
      .then((res) => {
        if (res.data.status === 200) {
          localStorage.setItem("token", res.data.access_token);
          window.location.href = "/admin";
        } else {
          alert(res.data.message);
        }
      })
      .catch((err) => {
        alert(err.response.data.message);
      });
  }
};
</script>
<template>
    <!-- Outer Row -->
    <div class="row justify-content-center">
      <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-8">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">{{ $t('Login In') }}</h1>
                  </div>
                  <form class="user">
                    <div class="form-group">
                        <label for="inputPage" class="form-label">{{ $t('email') }}</label>
                      <input
                        type="email"
                        class="form-control form-control-user"
                        id="exampleInputEmail"
                        v-model="email"
                        aria-describedby="emailHelp"
                        placeholder="Enter Email Address..."
                      />
                    </div>
                    <div class="form-group">
                          <label for="inputPage" class="form-label">{{ $t('password') }}</label>
                      <input
                        type="password"
                        v-model="password"
                        class="form-control form-control-user"
                        id="exampleInputPassword"
                        placeholder="Password"
                      />
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input
                          type="checkbox"
                          class="custom-control-input"
                          id="customCheck"
                        />
                        <label class="custom-control-label" for="customCheck"
                          >{{ $t('Remember Me') }}</label
                        >
                      </div>
                    </div>
                    <a
                      @click="Login()"
                      class="btn btn-primary btn-user btn-block mt-1"
                    >
                      {{ $t('Login') }}
                    </a>
                  </form>
                  <hr />
                  <div class="text-center">
                    <a class="btn btn-info" href="/forgot-password"
                      >{{ $t('Forgot Password?') }}</a
                    >
                  </div>
                  <div class="text-center">
                    <router-link  to="/register">
                      <a class="btn btn-success mt-1" href="#">{{ $t('Create an Account') }}</a>
                    </router-link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</template>
