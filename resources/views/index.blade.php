<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Kisaan mart</title>
    <link rel="stylesheet" href="{{ asset('assets/css/style1.css') }}" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>


</head>

<body>
    <header>
        <nav>
            <div class="logo">
                <img src="{{ asset('assets/images/km_logo.png') }}" alt="logo" height="50px">
            </div>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/terms">T&C</a></li>
                <li><a href="/privacy">Privacy Policy</a></li>
                <li><a href="/refund">Return, Refund and Shipping Policy</a></li>
                <li><a href="https://play.google.com/store/apps/details?id=com.tiffino.its_tiffino"
                        class="download-button">Download App</a></li>
                <li class="search-container">
                </li>
            </ul>
        </nav>



    </header>
    <section class="hero-section">
        <div class="container">
            <div class="left-content">
                <h1><b>Kisaan Mart</b></h1>
                <p style="color: #2196f3;"> <b>"Farm to Table, Delivered to Your Doorstep"</b></p>
                <a href="#" class="download-button">Download App</a>
            </div>
            <div class="right-content">
                <img src="{{ asset('assets/images/9Aug.gif') }}" alt="Image description">
            </div>
        </div>
    </section>
    <section class="features" id="features">
        <h1 class="heading"><span>ABOUT</span>US</h1>
    </section>

    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
        <div class="col-10 col-sm-8 col-lg-6">
            <img src="{{ asset('assets/images/about us.webp') }}" class="d-block mx-lg-auto img-fluid"
                alt="Bootstrap Themes" width="700" height="500" loading="lazy">
        </div>
        <div class="col-lg-6">
            <h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3"><i> Kisaan Mart : Get groceries deliver at your
                    doorsteps</i></h1>
            <p class="lead">Welcome to Kisaan Mart – your ultimate destination for a seamless grocery shopping
                experience! Our app is designed to revolutionize the way you shop for essentials, bringing convenience
                and quality right to your fingertips. At Kisaan Mart, we are committed to empowering every household
                with access to fresh, affordable, and high-quality groceries. With a diverse range of products, from
                farm-fresh produce to pantry staples and household items, we cater to all your daily needs in one
                convenient place.</p>
            <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                <button type="button" class="btn btn-outline-secondary btn-lg px-4">Learn More</button>
            </div>
        </div>
    </div>

    <h1 class="heading">Our <span>Products</span></h1>
    <div class="container">
        <div class="row row-cols-1 row-cols-md-6 g-2">
            <div class="col">
                <div class="card h-100">
                    <img src="assets\images\1.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <H6 class="card-title">AASHIRWAD WHOLE WHEAT 10KG</h6>
                        <p>₹ 608 /-</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="assets\images\22.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h6 class="card-title">FORTUNE POHA</h6>
                        <p>₹ 48 /-</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="assets\images\3.webp" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h6 class="card-title">HALDIRAM DESI GHEE 1L</h6>
                        <p>₹ 550 /-</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="assets\images\4.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h6 class="card-title">FORTUNE SUGAR 1KG</h6>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="assets\images\5.webp" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h6 class="card-title">APPLE 1Kg</h6>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100">
                    <img src="assets\images\6.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h6 class="card-title">OKRA 1Kg</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <section class="features" id="features">
        <h1 class="heading">Why is it <span>special?</span></h1>
    </section>

    <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
        <div class="col">
            <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg"
                style="background-image: url('images\features(1).jpg');">
                <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                    <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Convinient Delivery</h3>
                    <ul class="d-flex list-unstyled mt-auto">
                    </ul>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg"
                style="background-image: url('unsplash-photo-2.jpg');">
                <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
                    <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Wide Product Range</h3>
                    <ul class="d-flex list-unstyled mt-auto">
                    </ul>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg"
                style="background-image: url('unsplash-photo-3.jpg');">
                <div class="d-flex flex-column h-100 p-5 pb-3 text-shadow-1">
                    <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Multi-Language Support</h3>
                    <ul class="d-flex list-unstyled mt-auto">
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid bg-black text-light footer pt-5 mt-5 wow fadeIn">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
                    <ul>
                        <li><a class="btn btn-link" href="">About Us</a></li>
                        <li><a class="btn btn-link" href="/privacy">Privacy Policy</a></li>
                        <li><a class="btn btn-link" href="/terms">Terms &amp; Condition</a></li>
                    </ul>

                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
                    <h5 class="text-light fw-normal">7542-462166</h5>
                    <p class="text-light fw-normal">Infront of vandana convent school AB road, guna</p>
                    <p>amitkirar440@gmail.com</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
                    <h5 class="text-light fw-normal">Monday - Saturday</h5>
                    <p>10AM - 10PM</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
                    <p>Connect on whatsapp</p>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                        <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text"
                            placeholder="whatsapp ">
                        <button type="button"
                            class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    <div id="main-footer">
        <footer class="container">
            <p>copyright &copy;2024 kisaan mart made with ♥ by <a
                    href="https://www.intouchsoftware.co.in/">InTouchSoftwareSolutions</a><b></b></p>
        </footer>
    </div>
</body>

</html>
