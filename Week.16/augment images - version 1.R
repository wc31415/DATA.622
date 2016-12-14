library(magick)

# function applies 20 transformations to image and 
# writes the 20 transformed images to directory specified
img.aug <- function(aug.path, img, img.name) {
  
  t01 <- image_noise(img, noisetype="gaussian")
  t02 <- image_noise(img, noisetype="multiplicative gaussian")
  t03 <- image_noise(img, noisetype="impulse")
  t04 <- image_noise(img, noisetype="laplacian")
  t05 <- image_noise(img, noisetype="poisson")
  t06 <- image_flip(img)
  t07 <- image_flop(img)
  t08 <- image_rotate(img, 90)
  t09 <- image_rotate(img, 270)
  t10 <- image_negate(img)
  t11 <- image_blur(img, 10, 10)
  t12 <- image_flip(image_rotate(img, 90))
  t13 <- image_flop(image_noise(img, noisetype="gaussian"))
  t14 <- image_rotate(image_noise(img, noisetype="laplacian"), 270)
  t15 <- image_rotate(image_negate(img), 90)
  t16 <- image_rotate(image_negate(img), 270)
  t17 <- image_rotate(image_blur(img, 10, 10), 270)
  t18 <- image_flip(image_negate(img))
  t19 <- image_flip(image_blur(img, 10, 10))
  t20 <- image_rotate(image_noise(img, noisetype="impulse"), 90)
  
  image_write(t01, paste(aug.path, "t01", img.name, sep=""))
  image_write(t02, paste(aug.path, "t02", img.name, sep=""))
  image_write(t03, paste(aug.path, "t03", img.name, sep=""))
  image_write(t04, paste(aug.path, "t04", img.name, sep=""))
  image_write(t05, paste(aug.path, "t05", img.name, sep=""))
  image_write(t06, paste(aug.path, "t06", img.name, sep=""))
  image_write(t07, paste(aug.path, "t07", img.name, sep=""))
  image_write(t08, paste(aug.path, "t08", img.name, sep=""))
  image_write(t09, paste(aug.path, "t09", img.name, sep=""))
  image_write(t10, paste(aug.path, "t10", img.name, sep=""))
  image_write(t11, paste(aug.path, "t11", img.name, sep=""))
  image_write(t12, paste(aug.path, "t12", img.name, sep=""))
  image_write(t13, paste(aug.path, "t13", img.name, sep=""))
  image_write(t14, paste(aug.path, "t14", img.name, sep=""))
  image_write(t15, paste(aug.path, "t15", img.name, sep=""))
  image_write(t16, paste(aug.path, "t16", img.name, sep=""))
  image_write(t17, paste(aug.path, "t17", img.name, sep=""))
  image_write(t18, paste(aug.path, "t18", img.name, sep=""))
  image_write(t19, paste(aug.path, "t19", img.name, sep=""))
  image_write(t20, paste(aug.path, "t20", img.name, sep=""))
  
}



img.emo <- read.csv(file="E:/DATA 622/repo/legend-clean.csv", 
                    header=TRUE, stringsAsFactors=FALSE)

img.emo$emotion <- tolower(img.emo$emotion)

aug <- subset(img.emo, (img.emo$emotion != "neutral" & 
                          img.emo$emotion != "happiness"))

img.path <- "E:/DATA 622/repo/clean/"

aug.path <- "E:/DATA 622/repo/images-aug/"

for (i in 1:nrow(aug)) {
  img <- image_read(path=paste(img.path, aug[i,1], sep=""))
  img.aug(aug.path, img, aug[i,1])
}
