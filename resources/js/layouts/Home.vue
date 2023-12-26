<script setup>
import { ref } from "vue";
import Sidebar from "./SidBarComponent.vue";
import TopBar from "./TopBarComponent.vue";
import Footer from "./FooterComponent.vue";
const toggled = ref("");
const token = localStorage.getItem("token");
const user = ref("");
const textAlign = ref("right");
if(token){
axios.get('/user').then((res) => {
      user.value = res.data.user;
      localStorage.setItem("perUser", JSON.stringify(res.data.user.role.permissions));
    });
}
</script>
<template>
  <div  >
    <!-- Sidebar -->
    <Sidebar v-if="token" :toggled="toggled" />
    <!-- End of Sidebar -->
    <!-- Content Wrapper -->
    <div  >
      <!-- Main Content -->
      <div  >
        <!-- Topbar -->
        <TopBar v-if="token" @emitToggled="toggled = $event" :user="user" />
        <!-- End of Topbar -->
        <!-- Begin Page Content -->
        <div
    class="app-content content"
    :style="`text-align: ${textAlign}!important`"
  >
  <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper container-xxl p-0">
          <router-view :user="user" ></router-view>
        </div>
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
      <!-- Footer -->
      <Footer v-if="token" />
      <!-- End of Footer -->
    </div>
    <!-- End of Content Wrapper -->
  </div>
</template>
<style scoped>
</style>
