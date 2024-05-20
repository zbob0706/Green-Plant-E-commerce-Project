jQuery(document).ready(function() {
  "use strict";

    /*==============================
        home-slider js
        ¸ü¶àÏÂÔØ£ºhttp://www.bootstrapmb.com
    ==============================*/
    $('#home-slider').owlCarousel({
        loop: true,
        rewind: true,
        items: 1,
        margin: 0,
        nav: true,
        navText : ['<i class="bi bi-chevron-left"></i>','<i class="bi bi-chevron-right"></i>'],
        dots: false,
        animateOut: 'fadeOut',
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                nav: false,
                dots: true
            },
            479: {
                nav: false,
                dots: true
            },
            768: {
                nav: false,
                dots: true
            },
            979: {
                nav: false,
                dots: true
            },
            1199: {
                nav: true,
                dots: false
            }
        }
    });
    $('#home-slider').on('changed.owl.carousel', function() {
        $('#home-slider').trigger('stop.owl.autoplay');
        $('#home-slider').trigger('play.owl.autoplay');
    });

    /*==============================
        cat slider
    ==============================*/ 
    var swiper = new Swiper('.swiper#cat-slider', {
        rewind: true,
        slidesPerView: 4,
        grid: {
            rows: 1,
            fill: 'row' | 'column',
        },
        spaceBetween: 30,
        observer: true,
        loop: true,
        observeParents: true,
        watchSlidesProgress: true,navigation: {
            nextEl: '.swiper-prev-category',
            prevEl: '.swiper-next-category',
        },
        pagination: {
            el: ".swiper-pagination-related",
            clickable: true
        },
        breakpoints: {
            0: {
                spaceBetween: 12,
                slidesPerView: 1
            },
            479: {
                spaceBetween: 12,
                slidesPerView: 1
            },
            540: {
                spaceBetween: 12,
                slidesPerView: 2
            },
            768: {
                spaceBetween: 30,
                slidesPerView: 2
            },
            979: {
                spaceBetween: 30,
                slidesPerView: 3
            },
            1199: {
                spaceBetween: 30,
                slidesPerView: 3
            },
            1599: {
                spaceBetween: 30,
                slidesPerView: 4
            }
        }
    });

    /*==============================
        product-slider js
    ==============================*/
    var swiper = new Swiper('.swiper#product-slider', {
        rewind: true,
        slidesPerView: 4,
        grid: {
            rows: 1,
            fill: 'row' | 'column',
        },
        spaceBetween: 30,
        observer: true,
        observeParents: true,
        watchSlidesProgress: true,
        navigation: {
            nextEl: '.swiper-button-prev-best-category',
            prevEl: '.swiper-button-next-best-category',
        },
        scrollbar: {
            el: '.swiper-scrollbar',
            hide: true,
        },
        pagination: {
            el: ".swiper-pagination-product",
            clickable: true,
        },
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
            pauseOnMouseEnter: true
        },
        breakpoints: {
        0: {
                slidesPerView: 1,
                spaceBetween: 12
            },
            360: {
                slidesPerView: 2,
                spaceBetween: 12
            },
            540: {
                slidesPerView: 2,
                spaceBetween: 12
            },
            640: {
                slidesPerView: 3,
                spaceBetween: 12
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            979: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1199:{
                slidesPerView: 4,
                spaceBetween: 30
            },
            1599: {
                spaceBetween: 30,
                slidesPerView: 5
            }
        }
    });
    
    /*==============================
        category-slider js
    ==============================*/
    var swiper = new Swiper('.swiper#category-slider', {
        rewind: true,
        slidesPerView: 4,
        grid: {
            rows: 1,
            fill: 'row' | 'column',
        },
        spaceBetween: 30,
        observer: true,
        observeParents: true,
        watchSlidesProgress: true,
        navigation: {
            nextEl: '.swiper-prev-categoryslider',
            prevEl: '.swiper-next-categoryslider',
        },
        pagination: {
            el: ".swiper-pagination-categoryslider",
            clickable: true,
        },
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
                pauseOnMouseEnter: true
            },
        breakpoints: {
            0: {
                slidesPerView: 1,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 12
            },
            320: {
                slidesPerView: 1,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 12
            },
            360: {
                slidesPerView: 2,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 12
            },
            540: {
                slidesPerView: 2,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 12
            },
            640: {
                slidesPerView: 2,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 12
            },
            768: {
                slidesPerView: 2,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 30
            },
            1024: {
                slidesPerView: 3,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 30
            },
            1199: {
                slidesPerView: 4,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 30
            }
        }
    });

    /*==============================
        testimonial-slider js
    ==============================*/
    var swiper = new Swiper('.swiper#testimonial-slider', {
            rewind: true,
            slidesPerView: 4,
            loop: true,
            grid: {
                rows: 1,
                fill: 'row' | 'column',
            },
            spaceBetween: 30,
            observer: true,
            observeParents: true,
            watchSlidesProgress: true,
            navigation: {
                nextEl: '.swiper-prev-testi',
                prevEl: '.swiper-next-testi',
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
                pauseOnMouseEnter: true
            },
            breakpoints: {
            0: {
                spaceBetween: 12,
                slidesPerView: 1
            },
            479: {
                spaceBetween: 12,
                slidesPerView: 1
            },
            540: {
                spaceBetween: 12,
                slidesPerView: 1
            },
            768: {
                spaceBetween:30,
                slidesPerView: 1
            },
            979: {
                spaceBetween: 30,
                slidesPerView: 1
            },
            1199: {
                spaceBetween: 30,
                slidesPerView: 2
            },
            1599: {
                spaceBetween: 30,
                slidesPerView: 4
            }
        }
    });

    /*==============================
        trending-slider js
    ==============================*/
    var swiper = new Swiper('.swiper#trending-slider', {
        rewind: true,
        slidesPerView: 4,
        grid: {
            rows: 1,
            fill: 'row' | 'column',
        },
        spaceBetween: 30,
        observer: true,
        observeParents: true,
        watchSlidesProgress: true,
        navigation: {
            nextEl: '.swiper-button-prev-trending',
            prevEl: '.swiper-button-next-trending',
        },
        scrollbar: {
            el: '.swiper-scrollbar',
            hide: true,
        },
        pagination: {
            el: ".swiper-pagination-product",
            clickable: true,
        },
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
            pauseOnMouseEnter: true
        },
        breakpoints: {
            0: {
                slidesPerView: 1,
                spaceBetween: 12
            },
            360: {
                slidesPerView: 2,
                spaceBetween: 12
            },
            540: {
                slidesPerView: 2,
                spaceBetween: 12
            },
            640: {
                slidesPerView: 3,
                spaceBetween: 12
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            979: {
                slidesPerView: 3,
                spaceBetween: 30
            },
            1199:{
                slidesPerView: 4,
                spaceBetween: 30
            },
            1599: {
                spaceBetween: 30,
                slidesPerView: 5
            }
        }
    });

    /*==============================
        blog-slider js
    ==============================*/
    var swiper = new Swiper('.swiper#blog-slider', {
        rewind: true,
        slidesPerView: 3,
        loop: true,
        grid: {
            rows: 1,
            fill: 'row' | 'column',
        },
        spaceBetween: 30,
        observer: true,
        observeParents: true,
        watchSlidesProgress: true,
        navigation: {
            nextEl: '.swiper-prev-blog',
            prevEl: '.swiper-next-blog',
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
            pauseOnMouseEnter: true
        },
        breakpoints: {
            0: {
                slidesPerView: 1,
                spaceBetween:12,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 12
            },
            479: {
                slidesPerView: 1,
                spaceBetween:12,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 12
            },
            540: {
                slidesPerView: 2,
                spaceBetween:12,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 12
            },
            768: {
                slidesPerView: 2,
                spaceBetween: 30,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 30
            },
            979: {
                slidesPerView: 3,
                spaceBetween: 30,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                },
                spaceBetween: 30
            },
            1199: {
                slidesPerView: 3,
                spaceBetween: 30,
                grid: {
                    rows: 1,
                    fill: 'row' | 'column',
                }
            }
        }
    });

    /*==============================
        brand-logo js
    ==============================*/
      $('#brand-logo').owlCarousel({
        loop: false,
        rewind: true,
        margin: 30,
        nav: false,
        navText: ['<i class="ri-arrow-left-line"></i>','<i class="ri-arrow-right-line"></i>'],
        dots: false,autoplay: true,
        sautoplayTimeout: 5000,
        autoplayHoverPause: true,
        responsive:{
          0:{
            items: 2,
            margin: 15
          },
          479:{
            items: 2,
             margin: 15
          },
          768:{
            items: 3
          },
          979:{
            items: 4
          },
          1199:{
            items: 5
          }
        }
    });

    /*==============================================================
        Fullscreen Height
    ==============================================================*/
        function resizefullscreen() {
            var minheight = $(window).height();
            $(".fullscreen").css('min-height', minheight);
        }
        $(window).resize(function () {
            resizefullscreen();
        });
        resizefullscreen();

    /*==============================
        countdown-time js
    ==============================*/
    if($('#day1').length >= 1){
        var deadline1 = new Date("december 31, 2023 23:59:59").getTime();
        var x = setInterval(function() {
            var currentTime = new Date().getTime();
            var t = deadline1 - currentTime;
            var days = Math.floor(t / (1000 * 60 * 60 * 24));
            var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60));
            var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((t % (1000 * 60)) / 1000);
            document.getElementById("day1").innerHTML = days ;
            document.getElementById("hrs1").innerHTML = hours;
            document.getElementById("min1").innerHTML = minutes;
            document.getElementById("sec1").innerHTML = seconds;
            if (t < 0) {
                clearInterval(x);
                document.getElementById("day1").innerHTML = '0';
                document.getElementById("hrs1").innerHTML = '0';
                document.getElementById("min1").innerHTML = '0';
                document.getElementById("sec1").innerHTML = '0';
            }
        }, 1000);
    }
});