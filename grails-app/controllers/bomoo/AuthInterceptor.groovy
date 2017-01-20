package bomoo

class AuthInterceptor {

	Long startProcessTime
	Long endProcessTime
	Long endRenderTime

	AuthInterceptor() {
		matchAll()
	}

    boolean before() { 
    	startProcessTime = System.currentTimeMillis()
        log.println "Controller : " + params.controller + "\t\t\t Action : " + params.action
    	true 
    }

    boolean after() {
    	endProcessTime = System.currentTimeMillis()
    	log.println "Time taken to process : " + (endProcessTime - startProcessTime)/1000 + " sec"
    	true 
    }

    void afterView() { 
    	endRenderTime = System.currentTimeMillis()
    	log.println "Time taken to render : " + (endRenderTime - endProcessTime)/1000 + " sec\n"

    	if (endRenderTime - startProcessTime > 2999) {
    		log.println "WARNING : The performance is not as expected\n"	
    	}
    }
}
