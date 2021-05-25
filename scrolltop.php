<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="public/style.css">
    <link rel="stylesheet" href="public/js/main.js">
    <style>
        #myBtn {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Fixed/sticky position */
            bottom: 20px;
            /* Place the button at the bottom of the page */
            right: 30px;
            /* Place the button 30px from the right */
            z-index: 99;
            /* Make sure it does not overlap */
            border: none;
            /* Remove borders */
            outline: none;
            /* Remove outline */
            background-color: red;
            /* Set a background color */
            color: white;
            /* Text color */
            cursor: pointer;
            /* Add a mouse pointer on hover */
            padding: 15px;
            /* Some padding */
            border-radius: 10px;
            /* Rounded corners */
            font-size: 18px;
            /* Increase font size */
        }

        #myBtn:hover {
            background-color: #555;
            /* Add a dark-grey background on hover */
        }
    </style>
</head>

<body>
    <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

</body>
<script>
    mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {
        scrollFunction()
    };

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }
</script>
<script>
    window.onload = function() {

        const easeInCubic = function(t) {
            return t * t * t
        }
        const scrollElems = document.getElementsByClassName('scroll');


        //console.log(scrollElems);
        const scrollToElem = (start, stamp, duration, scrollEndElemTop, startScrollOffset) => {
            //debugger;
            const runtime = stamp - start;
            let progress = runtime / duration;
            const ease = easeInCubic(progress);

            progress = Math.min(progress, 1);
            console.log(startScrollOffset, startScrollOffset + (scrollEndElemTop * ease));

            const newScrollOffset = startScrollOffset + (scrollEndElemTop * ease);
            window.scroll(0, startScrollOffset + (scrollEndElemTop * ease));

            if (runtime < duration) {
                requestAnimationFrame((timestamp) => {
                    const stamp = new Date().getTime();
                    scrollToElem(start, stamp, duration, scrollEndElemTop, startScrollOffset);
                })
            }
        }

        for (let i = 0; i < scrollElems.length; i++) {
            const elem = scrollElems[i];

            elem.addEventListener('click', function(e) {
                e.preventDefault();
                const scrollElemId = e.target.href.split('#')[1];
                const scrollEndElem = document.getElementById(scrollElemId);

                const anim = requestAnimationFrame(() => {
                    const stamp = new Date().getTime();
                    const duration = 1200;
                    const start = stamp;

                    const startScrollOffset = window.pageYOffset;

                    const scrollEndElemTop = scrollEndElem.getBoundingClientRect().top;

                    scrollToElem(start, stamp, duration, scrollEndElemTop, startScrollOffset);
                    // scrollToElem(scrollEndElemTop);
                })
            })
        }
    }
</script>

</html>