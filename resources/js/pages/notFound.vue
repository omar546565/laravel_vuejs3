<script setup>
</script>
<template>
       <div class="text-center">
                        <div class="error     center m-auto  rounded" data-text="404">404</div>
                        <p class="lead text-gray-800 mb-5">{{ $t('Page Not Found') }}</p>
                        <p class="text-gray-500 mb-0">{{ $t('It looks like you found a glitch in the matrix...') }}</p>
                        <a href="/admin">&larr; {{ $t('Back to admin') }}</a>
                    </div>
</template>
