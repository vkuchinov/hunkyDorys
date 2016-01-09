/*

$(function() {
    
    var canvas = document.getElementById("canvas");
    var ctx; 
    
    //a complex number
    var v;
    
    var real = function(n) {
        return n / 15.0 - 10.0
    };
    var imag = function(n) {
        return -n / 15.0 + 10
    }

    var add = function(z1, z2) {
        return [z1[0] + z2[0], z1[1] + z2[1]]
    }
    var mult = function(z1, z2) {
        return [z1[0] * z2[0] - z1[1] * z2[1], z1[0] * z2[1] + z1[1] * z2[0]]
    }
    var modulus = function(z) {
        if (z[1] > 0) {
            return Math.atan2(z[1], z[0])
        }
        else {
            return Math.atan2(z[1], z[0]) + 2 * Math.PI
        }
    };

    var complexToRGB = function(z) {
        
        //transfering w value
        
        var theta = modulus(z) % (2 * Math.PI)
        var hue = (theta / (2 * Math.PI)) * 6
        var X = Math.abs(Math.round((1 - Math.abs(hue % 2 - 1)) * 255))
        var C = [0, 0, 0];
        if (hue >= 0 && hue < 1) {
            C[0] = 255;
            C[1] = X;
        } else if (1 <= hue && hue < 2) {
            C[0] = X;
            C[1] = 255;
        } else if (2 <= hue && hue < 3) {
            C[1] = 255;
            C[2] = X;
        } else if (3 <= hue && hue < 4) {
            C[1] = X;
            C[2] = 255;
        } else if (4 <= hue && hue < 5) {
            C[0] = X;
            C[2] = 255;
        } else if (5 <= hue && hue < 6) {
            C[0] = 255;
            C[2] = X;
        }
        return C
    }

    //the function f(z) = z*(z+5)*(z+v)
    //             f(z) = mult(add(mult(z, z), mult([5, 5], z)), add(z, v));
    //             UPDATED:
    //             f(z) = z*(z+5)
    //             f(z) = add(mult(z, z), mult([5, 5], z)));
    //             
    
    //             mult(z1, z2): z1: add(mult(z, z), mult([5, 5], z)) ;z2: add(z, v)
    
    var f = function(z) {
        
        //f(z) = z*(z+5)
        //f(z) = add(mult(z, z), mult([5, 5], z)));
        return add(mult(z, z), mult([5, 5], z))
    }

    ctx = canvas.getContext("2d");
    var imageData = ctx.getImageData(0, 0, 300, 300);

    renderFrame = function(){

        for (var yy = 0;  yy < 300; yy++) {
            for (var xx = 0; xx < 300; xx++) {
                
                //a complex number
                //v = [-real(150), -imag(150)];
                var x = real(xx)
                var y = imag(yy);
                var z = [x, y]
                
                //main function
                var w = f(z);  
                //console.log(w);
                
                var colArr = complexToRGB(w)

                var offset = (yy * 300 + xx) * 4;
                imageData.data[offset] = colArr[0];
                imageData.data[offset + 1] = colArr[1];
                imageData.data[offset + 2] = colArr[2];
                imageData.data[offset + 3] = 255;
            }
        }
        ctx.putImageData(imageData, 0, 0);
    }

    function animate() {
        return setInterval(renderFrame, 1000 / 25);
    }

    animate();


});



*/
