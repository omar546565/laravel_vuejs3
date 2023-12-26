<script setup>
import { ref } from 'vue'
import { onMounted, watchEffect } from "@vue/runtime-core";
onMounted(async () => {
   await  getPages();
});
const props = defineProps([
    "toggled"]
)
const filteredSubPages=(pages,per)=>{
    return pages.filter((page) => {
        return  chickPermission(page.id,per)}
        )
}
const textAlign = ref("left");
const token = localStorage.getItem("token");
const Setting = JSON.parse(localStorage.getItem("Setting"));
const chickPermission=(page_id,per)=>{
    let permission = perUser.value.find(
        permission => permission.page_id === page_id
        && permission[per] === 1
        );
        if(permission){
            return true;
        }else{
            return false;
        }
}
const pages = ref([]);
const getPages = async () => {
   await  axios.get(`get-pages`).then((res) => {
        pages.value = res.data.pages;
        // notify(res.data.message);
    });
}
const perUser = ref(JSON.parse(localStorage.getItem("perUser")));
watchEffect(() => {
    if ( perUser.value == null) {
        window.location.reload();
    }
});
</script>
<template>
  <!-- BEGIN: Main Menu-->
  <div
    class="main-menu menu-fixed menu-light menu-accordion menu-shadow"
    data-scroll-to-active="true"
    :style="`text-align: ${textAlign}!important`"
  >
    <div class="navbar-header">
      <ul class="nav navbar-nav flex-row">
        <li class="nav-item me-auto">
          <a href="/indexvue" class="logo logo-light">
            <img
              src="/app-assets/images/1679163509.png"
              alt=""
              height="60"
            />
          </a>
        </li>
        <li class="nav-item nav-toggle">
          <a class="nav-link modern-nav-toggle pe-0" data-bs-toggle="collapse">
            <i
              class="d-block d-xl-none text-primary toggle-icon font-medium-4"
              data-feather="x"
            ></i>
            <i
              class="d-none d-xl-block collapse-toggle-icon font-medium-4 text-primary"
              data-feather="disc"
              data-ticon="disc"
            ></i>
          </a>
        </li>
      </ul>
    </div>
    <div class="shadow-bottom"></div>
    <div  class="main-menu-content">
      <ul
        class="navigation navigation-main"
        id="main-menu-navigation"
        data-menu="menu-navigation"
      >
        <li
          v-for="page in pages" :key="page.id"  :class="'nav-item main'+ $route.name == page.path ? 'active': ''  "
        >
        <RouterLink
     v-if="page.path != '#' && chickPermission(page.id,'read') && page.page_id == 0"
     :to="page.path"
     class="nav-link"
     >
            <i :class="page.icon"></i>
            <span>{{ $t(page.page) }}</span>
        </RouterLink>
          <a  v-if="filteredSubPages(page.pages,'read').length > 0 && chickPermission(page.id,'read')"  class="d-flex align-items-center"
             href="#">
            <i :class="page.icon"></i>
            <span class="menu-title text-truncate" data-i18n="Dashboards">
                {{ $t(page.page) }}
            </span>
            <span class="badge badge-light-warning rounded-pill ms-auto me-1">
            </span>
          </a>
          <ul class="menu-content">
            <div >
              <li
              v-for="sub in filteredSubPages(page.pages,'read')"
            :key="sub.id"
                :class=" $route.name == sub.path ? 'active': ''  "
              >
              <RouterLink
              style="height: 50px;"
            :to="sub.path"
             class="collapse-item">
            <i :class="sub.icon"></i>
            <span class="m-2" > {{ $t(sub.page) }}</span>
            </RouterLink>
              </li>
            </div>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</template>
