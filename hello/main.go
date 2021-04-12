package main
import (
	"github.com/gin-gonic/contrib/static"
	"github.com/gin-gonic/gin"
)
func main() {
	router := gin.Default()
	router.Use(static.Serve("/", static.LocalFile("./www", true)))
	router.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	router.Run(":3000")
}

