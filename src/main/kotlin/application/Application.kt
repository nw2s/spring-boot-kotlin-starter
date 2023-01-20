package application

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer
import org.springframework.context.annotation.ComponentScan

@SpringBootApplication
@ComponentScan("controllers", "config", "org.springdoc")
class Application : SpringBootServletInitializer()

fun main(args: Array<String>)
{
	runApplication<Application>(*args)
}
