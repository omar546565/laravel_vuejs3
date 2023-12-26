<template>
  <div>
    <div class="demo-inline-spacing p-2">
      <button @click="addShow" class="btn btn-primary btn-relief-primary">
        {{ isAdd ? $t("back") : $t("add") }}
      </button>
    </div>
    <div v-if="isAdd">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-header">
              <h4 class="card-title">
                <span v-if="isEdit">
                  {{ $t("Edit setup") }}
                </span>
                <span v-else>
                  {{ $t("Add settings") }}
                </span>
              </h4>
            </div>
            <div class="card-body">
              <hr />
              <div class="row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                  <label>
                    {{ $t("key") }}
                  </label>
                  <input
                    type="text"
                    v-model="keyValue"
                    class="form-control form-control-page"
                    placeholder="  keyValue"
                  />
                </div>
              </div>
              <div class="row" v-for="(lang, index) in refForm" :key="index">
                <div class="col-sm-6 mb-3 mb-sm-0">
                  <label>
                    {{ $t(lang.lang) }}
                  </label>
                  <input
                    type="text"
                    v-model="lang.value"
                    class="form-control form-control-page"
                    placeholder="  keyValue"
                  />
                </div>
              </div>
              <div class="col-sm-6 mb-3 mb-sm-0">
                <a
                  @click="addLang()"
                  class="btn btn-primary btn-role btn-block m-1"
                >
                  {{ isEdit ? "update  " : "create  " }}
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-if="!isAdd" class="row" id="table-head">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h4 class="card-title">{{ $t("Table langs") }}</h4>
          </div>
          <div class="table-responsive">
            <table class="table">
              <thead class="table-dark">
                <tr>
                  <th>{{ $t("language") }}</th>
                  <th>{{ $t("key") }}</th>
                  <th>{{ $t("value") }}</th>
                  <th>{{ $t("Actions") }}</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(lang, index) in langs" :key="index">
                  <td>
                    {{ lang.lang }}
                  </td>
                  <td>
                    {{ lang.key }}
                  </td>
                  <td>
                    {{ lang.value }}
                  </td>
                  <td>
                    <div class="d-flex">
                      <button
                        class="btn btn-primary btn-sm"
                        @click="editLang(lang.key)"
                      >
                        <i class="fa fa-edit"></i>
                      </button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref } from "@vue/reactivity";
import { onMounted, inject } from "@vue/runtime-core";
import { toast } from "vue3-toastify";
import axios from "axios";
const errors = ref([]);
const fields = ref({
  lang: "lang",
  key: "key",
  value: "value",
});
const notify = (message) => {
  toast.success(message, {
    autoClose: 1000,
    position: toast.POSITION.TOP_CENTER,
  });
};
const langs = ref([]);
const isAdd = ref(false);
const isEdit = ref(false);
const keyValue = ref("");
const refForm = ref([
  {
    lang: "ar",
    value: "",
  },
  {
    lang: "en",
    value: "",
  },
  {
    lang: "fr",
    value: "",
  },
  {
    lang: "tr",
    value: "",
  },
]);
const getLangForm = () => {
  keyValue.value = "";
  refForm.value = [
    {
      lang: "ar",
      value: "",
    },
    {
      lang: "en",
      value: "",
    },
    {
      lang: "fr",
      value: "",
    },
    {
      lang: "tr",
      value: "",
    },
  ];
};
const addShow = () => {
  isAdd.value = !isAdd.value;
  isEdit.value = false;
  getLangForm();
};
const addLang = async () => {
  await axios
    .post(`add-langs`, {
      refForm: refForm.value,
      keyValue: keyValue.value,
      isEdit: isEdit.value,
    })
    .then((r) => {
      console.log(r.data);
      let meassge = r.data.message;
      isAdd.value = false;
      isEdit.value = false;
      getLangForm();
      getLangs();
      localStorage.setItem("messages", "");
      axios.get("/get-i18n").then((res) => {
        localStorage.setItem("messages", JSON.stringify(res.data));
      });
      notify(meassge);
    })
    .catch((error) => {
      console.log(error);
      errors.value = error;
    });
};
const editLang = (key) => {
  isAdd.value = true;
  isEdit.value = true;
  console.log(key);
  axios.get(`langs/${key}`).then((r) => {
    refForm.value = r.data.langs;
    keyValue.value = key;
  });
};
const getLangs = async () => {
  await axios.get(`langs`).then((r) => {
    langs.value = r.data.langs;
  });
};
onMounted(async () => {
  await getLangs();
});
</script>
