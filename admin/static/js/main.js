/*==============================
    pre-loader js
==============================*/
$(window).on('load', function() {
    $('.preloader').delay(0).fadeOut('fast');
});

/*==============================
    img-zoom js
==============================*/
function zoom(e){
    var zoomer = e.currentTarget;
    e.offsetX ? offsetX = e.offsetX : offsetX = e.touches[0].pageX
    e.offsetY ? offsetY = e.offsetY : offsetX = e.touches[0].pageX
    x = offsetX/zoomer.offsetWidth*100
    y = offsetY/zoomer.offsetHeight*100
    zoomer.style.backgroundPosition = x + '% ' + y + '%';
}

/*==============================
    popup js
==============================*/
//$(window).on('load',function() {
//    $('#popup').modal('show');
//});

jQuery(document).ready(function() {
  "use strict";
  
    /*==============================
        header sticky js
    ==============================*/
    $(document).ready(function() {
        var lastScrollTop = 0;
        $(window).scroll(function() {
            var scroll = $(this).scrollTop();
            if (scroll > lastScrollTop) {
                $('.header-area').addClass('sticky-down');
                $('.header-area').removeClass('sticky-up');
            } 
            else {
                if (lastScrollTop <= 100) {
                    $('.header-area').removeClass('sticky');
                    $('.header-area').removeClass('sticky-down');
                    $('.header-area').removeClass('sticky-up');
                } else {
                    $('.header-area').addClass('sticky');
                    $('.header-area').removeClass('sticky-down');
                    $('.header-area').addClass('sticky-up');
                }
            }
            lastScrollTop = scroll;
        });
    });
    
    /*==============================
        currnecy  js
    ==============================*/
    $(".local-currency button.currency-title-lg").on('click', function () {
        if($(".local-currency button.currency-title-lg").hasClass("active")) {
            $(".local-currency #desk-menu-currency , .local-currency #resp-menu-currency").removeClass("active");
            $(this).removeClass("active");
        } else {
            $(".local-currency #desk-menu-currency , .local-currency #resp-menu-currency").addClass("active");
            $(this).addClass("active");
        }
    });

    /*==============================
        menu js
    ==============================*/
    $('button.toggler-button').on('click', function () {
        $('#menu-toggle').addClass("active");
        $('.screen-bg').addClass("active");
        $('body').addClass("hidden");
    });
    $('button.close-box').on('click', function () {
        $('#menu-toggle').removeClass("active");
        $('.screen-bg').removeClass("active");
        $('body').removeClass("hidden");
    });

    /*==============================
        screen-bg js
    ==============================*/
    $(".screen-bg").on('click', function () {
        $(this).removeClass("active");
        $("#menu-toggle").removeClass("active");
        $(".mini-cart").removeClass("active");
        $("body").removeClass("hidden");
    });

    /*==============================
        filter js
    ==============================*/
    $('button.filter-button').on('click', function () {
        $('.filter-sidebar').addClass("active");
        $('.screen-bg').addClass("active");
    });
    $('button.close-filter-sidebar').on('click', function () {
        $('.filter-sidebar').removeClass("active");
        $('.screen-bg').removeClass("active");
    });
    $('.screen-bg').on('click', function () {
        $('.filter-sidebar').removeClass("active");
        $('.screen-bg').removeClass("active");
        $('html').removeClass("hidden");
    });

    /*==============================
        mini-cart js
    ==============================*/
    // mini-cart
    $("a.cart-count").on('click', function () {
        $(".mini-cart").addClass("active");
        $(".screen-bg").addClass("active");
        $("html").addClass("hidden");
    });

    $("button.cart-close").on('click', function () {
        $(".mini-cart").removeClass("active");
        $(".screen-bg").removeClass("active");
        $("html").removeClass("hidden");
    });
    $(".screen-bg").on('click', function () {
        $(".mini-cart").removeClass("active");
        $(this).removeClass("active");
        $("body").removeClass("hidden");
        $("html").removeClass("hidden");
    });
    $('.add-to-cart').on('click', function () { 
        $('.mini-cart').addClass("active");
        $('body').addClass("hidden");
        $('.screen-bg').addClass("active");
    });

    // read-agree js
     $('label.box-area, .read-agree').on('click', function () {
        if($('.cust-checkbox, .create-checkbox').is(':checked')) {
            $('.checkout, .create').removeClass('disabled');
        }
        else {
            $('.checkout, .create').addClass('disabled');
        }
    });

    /*==============================
        product-menu-slider js
    ==============================*/
    var swiper = new Swiper('.swiper#product-menu-desklist, .swiper#product-menu-mobilelist', {
        rewind: true,
        slidesPerView: 1,
        grid: {
            rows: 2,
            fill: 'row' | 'column'
        },
        spaceBetween: 15,
        observer: true,
        observeParents: true,
        watchSlidesProgress: true,
        navigation: {
            nextEl: '.swiper-prev-product',
            prevEl: '.swiper-next-product'
        }
    });

    /*===================================
        product-grid js
    ===================================*/
    $('.list-change-view').on("click",function () {
        $('.list-change-view').removeClass('active');
        $(this).addClass('active');
    });
    $('.list-change-view').on("click",function () {
        event.preventDefault();
        var data_grid = $(this).attr('data-grid-view');
        if ($('.shop-product-wrap').hasClass('grid-1') || $('.shop-product-wrap').hasClass('grid-3')) {
            $('.shop-product-wrap').removeClass('grid-1');
            $('.shop-product-wrap').removeClass('grid-3');
            $('.shop-product-wrap').addClass('grid-'+data_grid);
        } else {
            $('.shop-product-wrap').addClass('grid-'+data_grid);
        }
    });

    /*============================== 
        silck-slider js
    ==============================*/
    // product-style-1 js
    $('.slider-big').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        centerMode: true,
        centerPadding: '0px',
        asNavFor: '.slider-small',
        adaptiveHeight: true,
    });
    $('.slider-small').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        prevArrow: '<button class="slick-prev"><i class=" feather-arrow-left"></i></button>',
        nextArrow: '<button class="slick-next"><i class=" feather-arrow-right"></i></button>',
        dots: false,
        centerMode: true,
        centerPadding: '0px',
        focusOnSelect: true,
        asNavFor: '.slider-big',
        responsive: [{
            breakpoint: 480,
            settings: {
                slidesToShow: 3
            }
        }]
    });

    // product-style-2 js
    $('.style2-slider-big').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        centerMode: true,
        centerPadding: '0px',
        asNavFor: '.style2-slider-small',
        adaptiveHeight: true,
    });
    $('.style2-slider-small').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: true,
        nextArrow: '<button class="slick-prev"><i class=" feather-arrow-left"></i></button>',
        prevArrow: '<button class="slick-next"><i class=" feather-arrow-right"></i></button>',
        dots: false,
        centerMode: true,
        centerPadding: '0px',
        focusOnSelect: true,
        asNavFor: '.style2-slider-big',
        vertical: true,
        verticalSwiping: true,
        responsive: [
        {
            breakpoint: 480,
            settings: {
                vertical: false,
                verticalSwiping: false
            }
        }
        ]
    });

    // product-style-3 js
    $('.style3-slider-small').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        prevArrow: '<button class="slick-prev"><i class=" feather-arrow-left"></i></button>',
        nextArrow: '<button class="slick-next"><i class=" feather-arrow-right"></i></button>',
        dots: false,
        centerMode: true,
        centerPadding: 'calc(33.33% - 30px)',
        focusOnSelect: true,
        responsive: [
        {
            breakpoint: 1199,
            settings: {
                arrows: false,
                dots: true
            }
        },
        {
            breakpoint: 1024,
            settings: {
                arrows: false,
                dots: true
            }
        },
        {
            breakpoint: 768,
            settings: {
                arrows: false,
                dots: true,
                centerMode: true,
                centerPadding: '0px',
            }
        }
        ]
    });

    // product-style-4 js
    $('.style4-slider-big').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        centerMode: true,
        centerPadding: '0px',
        asNavFor: '.style4-slider-small',
        adaptiveHeight: true,
    });
    $('.style4-slider-small').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        prevArrow: '<button class="slick-prev"><i class=" feather-arrow-left"></i></button>',
        nextArrow: '<button class="slick-next"><i class=" feather-arrow-right"></i></button>',
        dots: false,
        centerMode: true,
        centerPadding: '0px',
        focusOnSelect: true,
        asNavFor: '.style4-slider-big',
        vertical: true,
        verticalSwiping: true,
        responsive: [
        {
            breakpoint: 480,
            settings: {
                vertical: false,
                verticalSwiping: false
            }
        }
        ]
    });

    // product-style-5 js
    $('.style5-slider-small').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        prevArrow: '<button class="slick-prev"><i class=" feather-arrow-left"></i></button>',
        nextArrow: '<button class="slick-next"><i class=" feather-arrow-right"></i></button>',
        dots: true,
        focusOnSelect: true,
    });

    // product-style-6 js
    $('.slider-big-6').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        centerMode: true,
        centerPadding: '0px',
        asNavFor: '.slider-small-6',
        adaptiveHeight: true,
    });
    $('.slider-small-6').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: true,
        prevArrow: '<button class="slick-prev"><i class="bi bi-chevron-left"></i></button>',
        nextArrow: '<button class="slick-next"><i class="bi bi-chevron-right"></i></button>',
        dots: false,
        centerMode: true,
        centerPadding: '0px',
        focusOnSelect: true,
        asNavFor: '.slider-big-6',
        responsive: [{
            breakpoint: 480,
            settings: {
                slidesToShow: 3
            }
        }]
    });

    // magnificPopup
    $('.full-view').on('click', function () {
        $(this).next().magnificPopup('open');
    });
    $('.slider-big, .style2-slider-big, .style4-slider-big, .slider-big-6').magnificPopup({
        delegate: 'a',
        type: 'image',
        showCloseBtn: true,
        closeBtnInside: false,
        midClick: true,
        tLoading: 'Loading image #%curr%...',
        mainClass: 'mfp-img-mobile',
        gallery: {
            enabled: true,
            navigateByImgClick: true,
        preload: [0,1] //Will preload 0 - before current, and 1 after the current image
        },
        image: {
            tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
        }
    });

    /*============================== 
        related-slider js
    ==============================*/
    var swiper = new Swiper('.swiper#related-slider', {
        rewind: true,
        slidesPerView: 4,
        grid: {
            rows: 1,
            fill: 'row' | 'column',
        },
        spaceBetween: 30,
        observer: true,
        observeParents: true,
        watchSlidesProgress: true,navigation: {
            nextEl: '.swiper-next-related',
            prevEl: '.swiper-prev-related',
        },
        pagination: {
            el: ".swiper-pagination-related",
            clickable: true
        },
        breakpoints: {
            0: {
                slidesPerView: 1,
                spaceBetween: 12
            },
            320: {
                slidesPerView: 1,
                spaceBetween: 12
            },
            480: {
                slidesPerView: 2,
                spaceBetween: 12
            },
            640: {
                slidesPerView: 2,
                spaceBetween: 12
            },
            750: {
                slidesPerView: 2,
                spaceBetween: 12
            },
            768: {
                slidesPerView: 2,
                spaceBetween: 30
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1199: {
                slidesPerView: 4,
                spaceBetween: 30
            }
        }
    });

    /*========================================== 
        minus and plus btn js
    ==========================================*/
    $('.dec').click(function () {
        var $input = $(this).parent().find('input');
        var count = parseInt($input.val()) - 1;
        count = count < 1 ? 1 : count;
        $input.val(count);
        $input.change();
        return false;
    });
    $('.inc').click(function () {
        var $input = $(this).parent().find('input');
        $input.val(parseInt($input.val()) + 1);
        $input.change();
        return false;
    });

    /*===================================
        product-short js
    ===================================*/
    $('.product-short a.short-title-lg').on('click', function () {
        if ($('#select-wrap').hasClass('active')) {
            $('#select-wrap').removeClass('active');
            $(this).removeClass('active');
        }
        else {
            $('#select-wrap').addClass('active');
            $(this).addClass('active');
        }
    });

    /*==============================
       video popup js
    ==============================*/
    $('.play-button').magnificPopup ({
        type: 'iframe',
        tClose: 'Close (Esc)',
        mainClass: 'mfp-fade',
        removalDelay: 160
    });
    
    /*==============================
        counter js
    ==============================*/
    function count($this){
        var current = parseInt($this.html(), 10);
        current = current + 100; /* Where 50 is increment */
        $this.html(++current);
        if(current > $this.data('count-number')){
            $this.html($this.data('count-number'));
        } else {
            setTimeout(function(){count($this)}, 100);
        }
    }
    $(".count-number").each(function() {
        $(this).data('count-number', parseInt($(this).html(), 10));
        $(this).html('0');
        count($(this));
    });

    /*==============================
        back top js
    ==============================*/
    $(window).scroll(function() {
        if ($(this).scrollTop() > 600) {
            $('#top').addClass('show');
        } else { 
            $('#top').removeClass('show');
        }
    });
    $('#top').click(function(){
        $("html, body").animate({ scrollTop: 0 }, 600);
        return false;
    });
});
