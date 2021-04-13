FROM golang:alpine
RUN mkdir /hello 
ADD ./hello /hello/ 
WORKDIR /hello 
RUN go build -o main . 
CMD ["/hello/main"]
EXPOSE 7700





#FROM golang:alpine
#RUN mkdir /hello 
#ADD main.go /hello/ 
#WORKDIR /hello 
#RUN go build -o main . 
#RUN go run main.go 
#CMD ["/hello/main"]
#EXPOSE 7700




#FROM debian:latest
#RUN mkdir -p /service
#WORKDIR /service
#ADD ./build.tar.gz /service/
#CMD ./example





# STEP 1 build executable binary
#FROM golang:alpine as builder
#COPY main.go $GOPATH/src/mypackage/myapp/
#WORKDIR $GOPATH/src/mypackage/myapp/
#get dependancies
#RUN go get ./...
#RUN go get -d -v
#build the binary
#RUN go build -o /go/bin/hello

# STEP 2 build a small image
# start from scratch
# FROM scratch
# copy our static executable
#COPY --from=builder /go/bin/hello /go/bin/hello
#EXPOSE 7700
#ENTRYPOINT ["/go/bin/hello"]





#FROM golang:alpine AS build
#RUN apk --no-cache add gcc g++ make git
#WORKDIR /go/src/app
#COPY main.go .
#RUN go get ./...
#RUN GOOS=linux go build -ldflags="-s -w" -o ./bin/web-app ./main.go
#FROM alpine:3.9
#RUN apk --no-cache add ca-certificates
#WORKDIR /usr/bin
#COPY --from=build /go/src/app/bin /go/bin
#EXPOSE 7700
#ENTRYPOINT /go/bin/web-app --port 7700






#имя базового образа
#FROM golang:latest

#создаем папку, где будет программа
#RUN mkdir -p /go/src/app

#идем в папку
#WORKDIR /go/src/app

#копируем все файлы из текущего пути к файлу Docker на системе в новую папку образа
#COPY main.go /go/src/app

#скачиваем зависимые пакеты через скрипт, разработанный командой docker
#RUN go-wrapper download

#инсталлируем все пакеты и программу
#RUN go-wrapper install

#запускаем программу через тот же скрипт, чтобы не зависеть от ее скомпилированного имени
#-web - это параметр, передаваемый вашей программе при запуске, таких параметров может быть сколько угодно
#go-wrapper запускает set -x для того, чтобы отправить в stderr имя бинарника программы в момент ее запуска 

#CMD ["go-wrapper", "run", "-web"]
#пробрасываем порт программы наружу образа
#EXPOSE 7700
