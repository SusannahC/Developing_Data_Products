#
# This is the server logic of a Shiny web application. You can run the 
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$plot <- renderPlot({

        if(input$runSimulation > 0){
            lambda <- input$lambda
            n <- input$n
            nosim <- input$nosim
            
            # Save simulation results to simExp
            simExp <- matrix(rexp(nosim * n, lambda), nosim)
            
            simMeans <- apply(simExp, 1, mean)
            
            # Mean
            sampleMean <- mean(simMeans)
            
            theoreticalMean <- 1/lambda
            
            # Variance
            sampleVar <- var(apply(simExp, 1, mean))
            
            theoreticalVar <- (1/lambda)^2/n
            
            # Plot histogram of simulated means
            hist(simMeans,
                 breaks=n, 
                 freq=FALSE, 
                 col="white", 
                 main = "Simulated Means of Exponential Distribution",
                 xlab="Simulated Mean", 
                 ylab="Density")
            
            # Fit density
            lines(density(simMeans), col="blue", lwd=3, lty=1)
            
            # Draw a normal distribution with mean=1/lambda and sd=1/lambda/sqrt(n) 
            # which is also the mean and sd of exponential distribution in this project
            curve(dnorm(x, mean=1/lambda, sd=1/lambda/sqrt(n)), from=0, to=4, col="green", lwd=3, add=TRUE)
            
            # Add sample mean to the plot
            abline(v=sampleMean, col="darkblue", lwd=3)
            
            # Add theoretical mean to the plot
            abline(v=theoreticalMean, col="red", lwd=3)
            
            # Add legends
            legend("topright", 
                   legend=c("Fitting Exponential Distribution", "Normal Distribution", "Sample Mean", "Theoretical Mean"), 
                   col=c("blue", "green", "darkblue", "red"), lty=1, cex=0.8)
            
        }

    })
  
})
