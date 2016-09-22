package ocp

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

class PerformanceController {

    @Secured('ROLE_ADMIN')
    def index() { 
    	render view: "PerformanceReview"
    }

    @Secured('ROLE_ADMIN')
    def getData() { 
        def chalans = Chalan.findAll()

        def nn = new Date().day
        def xx = 42 + nn

        def last15DaysChalanList = chalans.findAll({p -> p.submittedOn > new Date() - xx && p.submittedOn < new Date() - nn })
        def last15DaysApprovedChalanList = chalans.findAll({p -> (p.approvedByTPOn > new Date() - xx && p.approvedByTPOn < new Date() - nn && p.status == "TPApproved") })
        def last15DaysPaidChalanList = chalans.findAll({p -> (p.paidOn > new Date() - xx && p.paidOn < new Date() - nn && p.status == "Paid") })

        def sd = last15DaysChalanList.groupBy{ it.submittedOn.format("ww") }.collect { date, chalanList -> return ["x" : date, "y" : chalanList.size()]}
        def ad = last15DaysApprovedChalanList.groupBy{ it.approvedByTPOn.format("ww") }.collect { date, chalanList -> return ["x" : date, "y" : chalanList.size()]}
        def pd = last15DaysPaidChalanList.groupBy{ it.paidOn.format("ww") }.collect { date, chalanList -> return ["x" : date, "y" : chalanList.size()]}

        def n = new Date().date
        def x = 181 + n

        def last12MonthsChalanList = chalans.findAll({p -> p.submittedOn > new Date() - x && p.submittedOn < new Date() - n })
        def last12MonthsApprovedChalanList = chalans.findAll({p -> (p.approvedByTPOn > new Date() - x && p.approvedByTPOn < new Date() - n && p.status == "TPApproved") })
        def last12MonthsPaidChalanList = chalans.findAll({p -> (p.paidOn > new Date() - x && p.paidOn < new Date() - n && p.status == "Paid") })

        def sm = last12MonthsChalanList.groupBy{ it.submittedOn.format("MMM, yy") }.collect { date, chalanList -> return ["x" : date, "y" : chalanList.size()]}
        def am = last12MonthsApprovedChalanList.groupBy{ it.approvedByTPOn.format("MMM, yy") }.collect { date, chalanList -> return ["x" : date, "y" : chalanList.size()]}
        def pm = last12MonthsPaidChalanList.groupBy{ it.paidOn.format("MMM, yy") }.collect { date, chalanList -> return ["x" : date, "y" : chalanList.size()]}

        def m = [ submittedDaily : sd.reverse(), approvedDaily : ad.reverse(), paidDaily : pd.reverse(), submittedMonthly : sm.reverse(), approvedMonthly : am.reverse(), paidMonthly : pm.reverse() ]
        render m as JSON
    }
}
