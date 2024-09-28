<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="{{ asset('/../../assets/vendors/mdi/css/materialdesignicons.min.css') }}">
    <link rel="stylesheet" href="{{ asset('/../../assets/vendors/css/vendor.bundle.base.css') }}">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="{{ asset('/../../assets/css/style.css') }}">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="{{ asset('/../../assets/images/favicon.png') }}" />
</head>

<body>
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="row w-100 m-0">
                <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
                    <div class="card col-lg-4 mx-auto">
                        <div class="card-body px-5 py-5">
                            <h3 class="card-title text-left mb-3">Login</h3>
                            {{-- <form id="loginForm"> --}}
                            <form method="POST" id="loginForm" action="{{ route('login') }}">
                                @csrf
                                <div class="form-group">
                                    <label>Username or email *</label>
                                    {{-- <input type="text" class="form-control p_input"> --}}
                                    <input id="email" type="email"
                                        class="form-control p_input @error('email') is-invalid @enderror" name="email"
                                        value="{{ old('email') }}" required autocomplete="email" autofocus
                                        style="color: white; ">

                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label>Password *</label>
                                    {{-- <input type="password" class="form-control p_input"> --}}
                                    <input id="password" type="password"
                                        class="form-control p_input @error('password') is-invalid @enderror"
                                        name="password" required autocomplete="current-password" style="color: white;">

                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="form-group d-flex align-items-center justify-content-between">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input"> Remember me
                                        </label>
                                    </div>
                                    <a href="{{ url('#') }}" class="forgot-pass">Forgot password</a>
                                </div>
                                <div class="text-center">
                                    {{-- <button type="button" class="btn btn-primary btn-block enter-btn">Login</button> --}}
                                    <button type="submit" class="btn btn-primary btn-block enter-btn">
                                        {{ __('Login') }}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- row ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>

    <!-- plugins:js -->
    <script src="{{ asset('/../../assets/vendors/js/vendor.bundle.base.js') }}"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="{{ asset('/../../assets/js/off-canvas.js') }}"></script>
    <script src="{{ asset('/../../assets/js/hoverable-collapse.js') }}"></script>
    <script src="{{ asset('/../../assets/js/misc.js') }}"></script>
    <script src="{{ asset('/../../assets/js/settings.js') }}"></script>
    <script src="{{ asset('/../../assets/js/todolist.js') }}"></script>
    <!-- endinject -->

</body>

</html>
