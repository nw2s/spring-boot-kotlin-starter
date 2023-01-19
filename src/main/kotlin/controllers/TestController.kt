package controllers

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import mu.KotlinLogging


@RestController
@RequestMapping("/test")
class TestController
{
    private val logger = KotlinLogging.logger {}

    @GetMapping("/isup")
    fun isup() : Boolean
    {
        logger.info { "Test Request Completed" }

        return true
    }
}