

    <!-- BEGIN: Vendor CSS-->
    @yield('vendor-style')

    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/vendors-rtl.min.css')}}">

    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/charts/apexcharts.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/extensions/toastr.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('icofont/icofont.min.css')}}">

    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->

    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/bootstrap.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/bootstrap-extended.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/colors.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/components.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/themes/dark-layout.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/themes/bordered-layout.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/themes/semi-dark-layout.css')}}">


    <!-- BEGIN: Page CSS-->
    @yield('page-style')

    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/core/menu/menu-types/vertical-menu.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/pages/dashboard-ecommerce.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/plugins/charts/chart-apex.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/plugins/extensions/ext-component-toastr.css')}}">

    <!-- END: Page CSS-->



    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css-rtl/pages/app-todo.css')}}">

    <!-- BEGIN: Custom CSS-->

    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css-rtl/custom-rtl.css')}}">



    <!-- END: Custom CSS-->

    <script  >
        let lang = localStorage.getItem("lang");
        if(!lang || lang == "ar" ){
            localStorage.setItem("lang", "ar");
            localStorage.setItem("textAlign", "right");
            var x = document.getElementsByTagName("link")
                for (i=0;i<x.length;++i) {
                if (x[i].getAttribute("href") == "{{asset('app-assets/vendors/css/vendors.min.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/vendors/css/vendors-rtl.min.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/bootstrap.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/bootstrap.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/custom.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/custom-rtl.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/core/menu/menu-types/vertical-menu.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/core/menu/menu-types/vertical-menu.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/pages/app-todo.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/pages/app-todo.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/plugins/extensions/ext-component-toastr.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/plugins/extensions/ext-component-toastr.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/bootstrap-extended.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/bootstrap-extended.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/pages/dashboard-ecommerce.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/pages/dashboard-ecommerce.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/plugins/charts/chart-apex.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/plugins/charts/chart-apex.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/colors.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/colors.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/components.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/components.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/themes/dark-layout.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/themes/dark-layout.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/themes/bordered-layout.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/themes/bordered-layout.css')}}")
                }
                if (x[i].getAttribute("href") == "{{asset('app-assets/css/themes/semi-dark-layout.css')}}") {
                    x[i].setAttribute("href", "{{asset('app-assets/css-rtl/themes/semi-dark-layout.css')}}")
                }


                    }
        }else{
            var x = document.getElementsByTagName("link")
                for (i=0;i<x.length;++i) {
                        if (x[i].getAttribute("href") == "{{asset('app-assets/vendors/css/vendors-rtl.min.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/vendors/css/vendors.min.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/bootstrap.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/bootstrap.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/custom-rtl.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/custom.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/core/menu/menu-types/vertical-menu.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/core/menu/menu-types/vertical-menu.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/pages/app-todo.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/pages/app-todo.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/plugins/extensions/ext-component-toastr.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/plugins/extensions/ext-component-toastr.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/bootstrap-extended.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/bootstrap-extended.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/pages/dashboard-ecommerce.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/pages/dashboard-ecommerce.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/plugins/charts/chart-apex.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/plugins/charts/chart-apex.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/colors.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/colors.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/components.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/components.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/themes/dark-layout.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/themes/dark-layout.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/themes/bordered-layout.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/themes/bordered-layout.css')}}")
                        }
                        if (x[i].getAttribute("href") == "{{asset('app-assets/css-rtl/themes/semi-dark-layout.css')}}") {
                            x[i].setAttribute("href", "{{asset('app-assets/css/themes/semi-dark-layout.css')}}")
                        }

                }
        }

    </script>

