FROM golang:1.14-alpine AS build

COPY . /src/
RUN CGO_ENABLED=0 go build -o /bin/api /src/cmd/main.go

FROM scratch
COPY --from=build /bin/api /bin/api

ENTRYPOINT [ "/bin/api" ]


