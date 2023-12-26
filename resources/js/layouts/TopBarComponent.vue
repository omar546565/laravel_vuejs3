<script setup>
import { ref } from "vue";
const toggled = ref("");
const emit = defineEmits(["emitToggled"]);
const props = defineProps(["user"]);
const lang = localStorage.getItem("lang");
const sidebarToggleTop = () => {
  if (toggled.value === "") {
    toggled.value = "toggled";
    emit("emitToggled", toggled.value);
  } else {
    toggled.value = "";
    emit("emitToggled", toggled.value);
  }
};
const messages = ref([]);
const textAlign = ref("right");
const changeLanguage = (lang) => {
  localStorage.setItem("lang", lang);
  if (lang == "ar") {
    localStorage.setItem("direction", "rtl");
    localStorage.setItem("textAlign", "right");
  } else {
    localStorage.setItem("direction", "ltr");
    localStorage.setItem("textAlign", "left");
  }
  window.location.reload();
};
const logout = () => {
  axios
    .get("/logout")
    .then((res) => {
      localStorage.removeItem("token");
      localStorage.removeItem("perUser");
      window.location.href = "/login";
    })
    .catch((err) => {
      console.log(err);
    });
  localStorage.removeItem("token");
  window.location.href = "/login";
};
</script>
<template>
   <nav
    class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-light navbar-shadow container-xxl"
  >
    <div class="navbar-container d-flex content">
      <div class="bookmark-wrapper d-flex align-items-center">
        <ul class="nav navbar-nav d-xl-none">
          <li class="nav-item">
            <a class="nav-link menu-toggle" href="#">
              <i class="ficon" data-feather="menu"></i>
            </a>
          </li>
        </ul>
        <ul class="nav navbar-nav bookmark-icons">
          <li class="nav-item d-none d-lg-block">
            <a hidden
              class="nav-link"
              href="app-email.html"
              data-bs-toggle="tooltip"
              data-bs-placement="bottom"
              title="Email"
            >
              <i class="ficon" data-feather="mail"></i>
            </a>
          </li>
          <li class="nav-item d-none d-lg-block">
            <a hidden
              class="nav-link"
              href="app-chat.html"
              data-bs-toggle="tooltip"
              data-bs-placement="bottom"
              title="Chat"
            >
              <i class="ficon" data-feather="message-square"></i>
            </a>
          </li>
          <li class="nav-item d-none d-lg-block">
            <a hidden
              class="nav-link"
              href="app-calendar.html"
              data-bs-toggle="tooltip"
              data-bs-placement="bottom"
              title="Calendar"
            >
              <i class="ficon" data-feather="calendar"></i>
            </a>
          </li>
          <li class="nav-item d-none d-lg-block">
            <a hidden
              class="nav-link"
              href="app-todo.html"
              data-bs-toggle="tooltip"
              data-bs-placement="bottom"
              title="Todo"
            >
              <i class="ficon" data-feather="check-square"></i>
            </a>
          </li>
        </ul>
        <ul hidden class="nav navbar-nav">
          <li class="nav-item d-none d-lg-block">
            <a class="nav-link bookmark-star">
              <i class="ficon text-warning" data-feather="star"></i>
            </a>
            <div class="bookmark-input search-input">
              <div class="bookmark-input-icon">
                <i data-feather="search"></i>
              </div>
              <input
                class="form-control input"
                type="text"
                placeholder="Bookmark"
                tabindex="0"
                data-search="search"
              />
              <ul class="search-list search-list-bookmark"></ul>
            </div>
          </li>
        </ul>
      </div>
      <ul class="nav navbar-nav align-items-center ms-auto">
        <li class="nav-item nav-search">
          <a class="nav-link nav-link-search">
            <i class="ficon" data-feather="search"></i>
          </a>
          <div class="search-input">
            <div class="search-input-icon"><i data-feather="search"></i></div>
            <input
              class="form-control input"
              type="text"
              placeholder="Explore Vuexy..."
              tabindex="-1"
              data-search="search"
            />
            <div class="search-input-close"><i data-feather="x"></i></div>
            <ul class="search-list search-list-main"></ul>
          </div>
        </li>
        <li class="nav-item dropdown dropdown-language">
          <a
            class="nav-link dropdown-toggle"
            id="dropdown-flag"
            href="#"
            data-bs-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            <img
              :src="`../app-assets/images/icons/translation.png`"
              alt="png"
              height="32"
            />
            <!-- <span class="selected-language"> {{ $t('language') }}</span> -->
          </a>
          <div
            class="dropdown-menu dropdown-menu-end"
            aria-labelledby="dropdown-flag"
          >
            <a
              class="dropdown-item"
              @click="changeLanguage('ar')"
              data-language="ar"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="flag-icon flag-icon-ae"></i>
              {{ $t("arabic") }}
            </a>
            <a
              class="dropdown-item"
              @click="changeLanguage('en')"
              data-language="en"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="flag-icon flag-icon-us"></i>
              {{ $t("english") }}
            </a>
            <a
              class="dropdown-item"
              @click="changeLanguage('tr')"
              data-language="tr"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="flag-icon flag-icon-tr"></i>
              {{ $t("Turkish") }}
            </a>
            <a
              class="dropdown-item"
              @click="changeLanguage('fr')"
              data-language="fr"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="flag-icon flag-icon-fr"></i>
              {{ $t("French") }}
            </a>
          </div>
        </li>
        <li class="nav-item dropdown dropdown-notification me-25">
          <a class="nav-link" href="#" data-bs-toggle="dropdown">
            <i class="ficon" data-feather="bell"></i>
            <span
              v-if="messages.length > 0"
              class="badge rounded-pill bg-danger badge-up"
            >
              {{ messages ? messages.length : 0 }}
            </span>
          </a>
          <ul class="dropdown-menu dropdown-menu-media dropdown-menu-end">
            <li class="dropdown-menu-header">
              <div class="dropdown-header d-flex">
                <h4 class="notification-title mb-0 me-auto">
                  {{ $t("notifications") }}
                </h4>
                <div class="badge rounded-pill badge-light-secondary">
                  <!--   <span class="align-middle">5 New</span>-->
                </div>
              </div>
            </li>
            <li class="scrollable-container media-list">
              <a class="d-flex" href="/useremployeemessagetableuser">
                <div class="list-item d-flex align-items-start">
                  <div class="me-1">
                    <div class="avatar">
                      <img
                        :src="'assets/images/portrait114x113.png'"
                        alt="avatar"
                        width="32"
                        height="32"
                      />
                    </div>
                  </div>
                  <div class="list-item-body flex-grow-1">
                    <p class="media-heading">
                      <span class="fw-bolder"></span>
                    </p>
                    <small class="tox-notification-success"></small>
                    <br />
                    <small class="notification-text"></small>
                  </div>
                </div>
              </a>
              <a class="d-flex" href="#"></a>
              <div class="list-item d-flex align-items-center">
                <h6 class="fw-bolder me-auto mb-0">
                  {{ $t("notifications") }} {{ $t("email") }}
                </h6>
                <div class="form-check form-check-primary form-switch">
                  <input
                    class="form-check-input"
                    id="systemNotification"
                    type="checkbox"
                    checked=""
                  />
                  <label
                    class="form-check-label"
                    for="systemNotification"
                  ></label>
                </div>
              </div>
              <div>
                <a
                  class="d-flex"
                  href="#"
                >
                  <div class="list-item d-flex align-items-start">
                    <div class="me-1">
                      <div class="avatar bg-light-danger">
                      </div>
                    </div>
                    <div class="list-item-body flex-grow-1">
                      <p class="media-heading">
                        <small class="tox-notification-success">
                        </small>
                        &nbsp;
                      </p>
                      <small class="notification-text">
                      </small>
                    </div>
                  </div>
                </a>
              </div>
            </li>
            <li class="dropdown-menu-footer">
              <a
                class="btn btn-success w-100"
                style="text-align: center !important;"
                href="/useremployeemessagetableuser"
              >
                عرض كل الإشعارات
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item dropdown dropdown-user">
          <a
            class="nav-link dropdown-toggle dropdown-user-link"
            id="dropdown-user"
            href="#"
            data-bs-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            <div   class="user-nav d-sm-flex d-none">
              <span class="user-name fw-bolder">
              </span>
              <span class="user-status">
              </span>
            </div>
            <span class="avatar">
                <img
                alt="avatar"
                width="50"
                height="50"
                     :src="`../images/user/${props.user.photo}`"
          />
              <span class="avatar-status-online"></span>
            </span>
          </a>
          <div
            class="dropdown-menu dropdown-menu-end"
            aria-labelledby="dropdown-user"
          >
            <router-link
              :to="{ name: 'Profile' }"
              class="dropdown-item"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="me-50" data-feather="user"></i>
              الملف الشخصي
            </router-link>
            <a hidden
              class="dropdown-item"
              href="app-email.html"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="me-50" data-feather="mail"></i>
              Inbox
            </a>
            <a hidden
              class="dropdown-item"
              href="app-todo.html"
              :style="`text-align: ${textAlign}!important`"
            >
              <i
                class="me-50"
                data-feather="check-square"
                :style="`text-align: ${textAlign}!important`"
              ></i>
              Task
            </a>
            <a hidden
              class="dropdown-item"
              href="app-chat.html"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="me-50" data-feather="message-square"></i>
              Chats
            </a>
            <div class="dropdown-divider"></div>
            <a hidden
              :style="`text-align: ${textAlign}!important`"
              class="dropdown-item"
              href="page-account-settings-account.html"
            >
              <i class="me-50" data-feather="settings"></i>
              Settings
            </a>
            <a hidden
              class="dropdown-item"
              href="page-pricing.html"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="me-50" data-feather="credit-card"></i>
              Pricing
            </a>
            <a hidden
              class="dropdown-item"
              href="page-faq.html"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="me-50" data-feather="help-circle"></i>
              FAQ
            </a>
            <form
              id="logout-form"
              action=""
              method="POST"
              style="display: none;"
            ></form>
            <a
              class="dropdown-item"
              @click="logout()"
              href="#"
              :style="`text-align: ${textAlign}!important`"
            >
              <i class="me-50" data-feather="power"></i>
              خروج أمن
            </a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <ul  class="main-search-list-defaultlist d-none">
    <li class="d-flex align-items-center">
      <a href="#">
        <h6 class="section-label mt-75 mb-0">Files</h6>
      </a>
    </li>
    <li class="auto-suggestion">
      <a
        class="d-flex align-items-center justify-content-between w-100"
        href="app-file-manager.html"
      >
        <div class="d-flex">
          <div class="me-75">
            <img :src="`../app-assets/images/icons/xls.png`" alt="png" height="32" />
          </div>
          <div class="search-data">
            <p class="search-data-title mb-0">omar new item submitted</p>
            <small class="text-muted">Marketing Manager</small>
          </div>
        </div>
        <small class="search-data-size me-50 text-muted">&apos;17kb</small>
      </a>
    </li>
  </ul>
  <ul class="main-search-list-defaultlist-other-list d-none">
    <li class="auto-suggestion justify-content-between">
      <a class="d-flex align-items-center justify-content-between w-100 py-50">
        <div class="d-flex justify-content-start">
          <span class="me-75" data-feather="alert-circle"></span>
          <span>No results found.</span>
        </div>
      </a>
    </li>
  </ul>
</template>
