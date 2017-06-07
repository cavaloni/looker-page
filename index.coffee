state = 
    currentPic: 'water'

switchPics = ->
    setTimeout (-> 
        if state.currentPic == 'water'
            state.currentPic = 'team'
            document.getElementsByClassName('image-container')[0].classList.remove 'image1';
            document.getElementsByClassName('image-container')[0].classList.add 'image3';
            setTimeout (-> 
                document.getElementsByClassName('image-container')[0].classList.remove 'image3';
                document.getElementsByClassName('image-container')[0].classList.add 'image2';
            ), 2000
            switchPics()
            movePoints();
        else
            state.currentPic = 'water'
            document.getElementsByClassName('image-container')[0].classList.remove 'image2';
            document.getElementsByClassName('image-container')[0].classList.add 'image1';
            switchPics()
            movePoints();
    ), 8000

switchPics()

movePoints = -> 

    $('.line-background').animate {
        opacity: 0
    }, 1000, ->
        height = $(window).height()
        width = $(window).width()
        console.log(height)

        index = 0
        previous
        while index < 7
            index+=1

            newPoint1 = 
                a: Math.floor Math.random() * height
                b: Math.floor Math.random() * width
            newPoint2 =
                a: Math.floor Math.random() * height
                b: Math.floor Math.random() * width

            console.log(newPoint1)

            circleEla = '.points' + index + 'a'
            circleElb = '.points' + index + 'b'
            $(circleEla).attr('cx', newPoint1.a)
            $(circleEla).attr('cy', newPoint1.b)

            $(circleElb).attr('cx', newPoint2.a)
            $(circleElb).attr('cy', newPoint2.b)

            lineEl = '.lines' + index
            $(lineEl).attr('x1', newPoint1.a)
            $(lineEl).attr('y1', newPoint1.b)
            $(lineEl).attr('x2', newPoint2.a)
            $(lineEl).attr('y2', newPoint2.b)

            previous = newPoint2

            if index > 1
                lineInEl = '.linesIn' + index - 1
                

        $('.line-background').animate {
            opacity: 1
        }, 1000

movePoints()