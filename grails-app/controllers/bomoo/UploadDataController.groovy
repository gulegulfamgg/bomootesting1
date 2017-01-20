
package bomoo

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.*
import auth.*

import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.util.CellReference;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import grails.transaction.Transactional
import grails.validation.ValidationException

@Transactional
@Secured('permitAll')
class UploadDataController {
    
    def springSecurityService
    def uploadDataService

    String fileLocation = "F:\\emp_list_1.xlsx"

    @Secured('permitAll')
    def index() { 
        // def userList = []

        // redirect action: 'saveZone'
        // // render "done"
    }

    def saveZone(){
        String excelFilePath = fileLocation;
        FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
         
        Workbook workbook = new XSSFWorkbook(inputStream);
        Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = firstSheet.iterator();
        
        while (rowIterator.hasNext()) {
            // def promise1 = Zone.async.task {
            //     withTransaction {
                    Row nextRow = rowIterator.next();
                    int rowNum = nextRow.getRowNum();
                    

                    Cell zoneCodeCell = nextRow.getCell(0);
                    Cell zoneNameCell = nextRow.getCell(1);

                    if (rowNum != 0){
                        // def zoneTemp = new Zone()
                        // zoneTemp.name = zoneNameCell;
                        // zoneTemp.code = zoneCodeCell;
                        // zoneTemp.save(flush:true)
                        uploadDataService.saveZone(zoneNameCell.getStringCellValue(),zoneCodeCell.getStringCellValue())
                        System.out.println('Zone Saved :' + zoneNameCell)
                    }
            //     }
            // }
        }
        redirect action: 'saveBranch'
    }

    def saveBranch(){
        String excelFilePath = fileLocation;
        FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
         
        Workbook workbook = new XSSFWorkbook(inputStream);
        Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = firstSheet.iterator();
        
        while (rowIterator.hasNext()) {
        
            // def promise2 = Branch.async.task {
            //     withTransaction {
                    Row nextRow = rowIterator.next();
                    int rowNum = nextRow.getRowNum();
                    
                    Cell zoneCodeCell = nextRow.getCell(0);
                    
                    Cell branchCodeCell = nextRow.getCell(2);
                    Cell branchNameCell = nextRow.getCell(3);

                    if (rowNum != 0){
                        // def z = Zone.findWhereCodeLike(zoneCodeCell)
                        // def branchTemp = new Branch()
                        String name = branchNameCell.getStringCellValue();
                        String code = branchCodeCell.getStringCellValue();
                        String zoneCode = zoneCodeCell.getStringCellValue();
                        // branchTemp.save(flush:true)
                        //System.out.println('branch Saved :' + branchTemp.name)
                        uploadDataService.saveBranch(name, code, zoneCode)
                        System.out.println('Branch ' + name)
                    }

            //     }
            // }
        }
        redirect action: 'saveUser'
    }

    def saveUser(){
     
         def file = request.getFile('file')
        String excelFilePath = fileLocation;
        FileInputStream inputStream = file.getInputStream();//new FileInputStream(new File(excelFilePath));
         
        Workbook workbook = new XSSFWorkbook(inputStream);
        Sheet firstSheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = firstSheet.iterator();
        
        while (rowIterator.hasNext()) {
        
            // def promise3 = User.async.task {
            //     withTransaction {
                    Row nextRow = rowIterator.next();
                    int rowNum = nextRow.getRowNum();
                    
                    Cell branchCodeCell = nextRow.getCell(2);
                    Cell branchNameCell = nextRow.getCell(3);
                    Cell zoneCodeCell = nextRow.getCell(0);
                    Cell zoneNameCell = nextRow.getCell(1);

                    Cell pfCell = nextRow.getCell(4); 
                    Cell nameCell = nextRow.getCell(5); 
                    Cell designationCell = nextRow.getCell(8);
                    Cell genderCell = nextRow.getCell(18);
                    Cell dobCell = nextRow.getCell(9);
                    Cell dorCell = nextRow.getCell(17);
                    Cell mobileCell = nextRow.getCell(21);
                    Cell scaleNoCell = nextRow.getCell(7);
                    Cell unionCodeCell = nextRow.getCell(11);
                    Cell unionNameCell = nextRow.getCell(12);
                    
                    if (rowNum != 0){
                        String branchCode = branchCodeCell.getStringCellValue();
                        String branchName = branchNameCell.getStringCellValue();
                        String zoneCode = zoneCodeCell.getStringCellValue();
                        String zoneName = zoneNameCell.getStringCellValue();
                        int usrnm = pfCell.getNumericCellValue();
                        String username = usrnm.toString();
                        String name = nameCell
                        String gender = genderCell

                        BigDecimal bd = new BigDecimal(mobileCell.getNumericCellValue());
                        //Double mobileNo = mobileCell.getNumericCellValue();
                        String contactNo = bd.longValue();
                        
                        String designation = designationCell
                        
                        // DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
                        // Date dob = df.parse(dobCell.getStringValue());
                        // Date dor = df.parse(dorCell.getStringValue());

                        String dateOfBirth = dobCell
                        String dateOfRetirement = dorCell

                        String unionCode = unionCodeCell
                        String emailId = "abc@abc.com"

                        
                        uploadDataService.saveUser(username, name, emailId, designation, gender, contactNo, zoneCode, zoneName, branchCode, branchName, dateOfBirth, dateOfRetirement, unionCode)
                        uploadDataService.saveScale(designation)
                        //userTemp.save(flush:true)
                        
                        System.out.println('user Saved :' + username + ' ; ' + bd.longValue())
                    }
            //     }
            // }
        }
        flash.msg = "Upload Service Completed"
        redirect action: 'index'
    }

    def test(){

            def z1 = new Zone("Site Admin Zone","Z1").save(flush:true)

        def b1 = new Branch("Home Branch", "B1", z1).save(flush:true)

        def r1 = new Role("ROLE_SITEADMIN", "Site Admin").save()
        def r2 = new Role("ROLE_ADMIN", "Admin").save()

        def u1 = new User("94241", "changeit", "gulegulfamgg@gmail.com", "SA", "M", "9424190146", b1, z1, "04/12/1991", "04/30/2050", "1").save(flush:true)
        
        UserRole.create u1, r2, true

        ArrayList zoneList = new ArrayList();
        zoneList.add(z1);

        def u = User.findAll()
        render u
    }

    
}