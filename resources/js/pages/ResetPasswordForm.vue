<script setup
>
import {useRoute} from 'vue-router'
const route = useRoute()
localStorage.setItem('token',route.query.token)
window.location.href = '/reset-password-form-sent'
</script>
