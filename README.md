# trendy_mobile_1

ขั้นตอนการติดตั้ง


  1.สร้างโฟลเดอร์ชื่อ src ใน ThisPC\Drive c\src
  
  2.โหลดไฟล์ในลิ้งนี้ https://docs.flutter.dev/get-started/install หลังจากนั้นแตกไฟล์ในโฟลเดอร์ src ที่ตั้งไว้จะได้โฟลเดอร์ชื่อ flutter มา
    หลังจากนั้นก็ update path ให้พิมพ์ค้นหาในช่องค้นหาของ window ว่า  Edit environment variables for your account. ไปที่ส่วนของตัว path หลังจากนั้นกดที่ edit กดที่ new แล้วก็ให้ใส่เป็น           ThisPC\Drive c\src\flutter\bin หลังจากนั้นก็กด ok ลองรัน cmd ละพิมพ์ flutter เพื่อ Test ว่าสามารถลงได้รึป่าว
    
  3.หลังจากนั้นให้โหลด Android studio แล้วติดตั้งให้เรียบร้อย
    หลังจากนั้น Set Path Android SDK ให้ทำตามลิ้งค์นี้ได้เลย https://www.youtube.com/watch?v=M1WorR8AQEc&list=PLltVQYLz1BMBUgyhxZFA31of-EKjazC8G&index=10
    
  4.ลง visual studio แล้วลองพิมพ์ flutter doctor ใน cmd ดูว่ามีอันไหนที่ตัวโปรเจ็ค required อีกมั้ย
  
  5.ลง flutter extensions ใน vs code 


ส่วนประกอบไฟล์ต่่างๆในโปรเจ็ค



  1.ใน lib\homepage\size_helper.dart จะเป็นตัวจัดการ Responsive 
  
  2. lib\locationService\location_service.dart ทำหน้าที่ get current location ของอุปกรณ์
  
  3. lib\homepage\forgotpassword Folder นี้จะเก็บหน้า forgotpassword ทั้งหมดไว้
  
  4. lib\homepage\login Folder นี้จะเก็บหน้า login ทั้งหมดไว้
  
  5. lib\homepage\map Folder นี้เก็บโครงของหน้าแมพไว้
  
  6. lib\homepage\notification Folder นี้เก็บโครงของหน้า notification ไว้
  
  7. lib\homepage\promotion Folder นี้เก็บโครงของหน้า promotion ไว้
  
  8. lib\homepage\rigister Folder นี้เก็บหน้า register ทั้งหมดไว้
  
  9. lib\homepage\sidemenu Folder นี้เก็บแทบ sidemenu และหน้าที่อยู่ใน sidemenu ทั้งหมดไว้
  
     9.1 lib\homepage\sidemenu\callcenter Folder นี้เก็บโครงหน้า callcenter ทั้งหมดไว้
     
     9.2 lib\homepage\sidemenu\coupon Folder นี้เก็บโครงหน้า coupon ทั้งหมดไว้
     
     9.3 lib\homepage\sidemenu\exreward Folder นี้เก็บโครงหน้าแลกรางวัลทั้งหมดไว้
     
     9.4 lib\homepage\sidemenu\history Folder นี้เก็บโครงหน้า history ทั้งหมดไว้
     
     9.5 lib\homepage\sidemenu\paymentmethod Folder นี้เก็บโครงหน้าวิธีการชำระเงินทั้งหมดไว้
     
     9.6 lib\homepage\sidemenu\personalinfo Folder นี้เก็บโครงหน้าของหน้า User ทั้งหมดไว้
     
     9.7 lib\homepage\sidemenu\stamp Folder นี้เก็บโครงหน้า stamp ทั้งหมดไว้ 
     
  10. lib\homepage\topup Folder นี้เก็บโครงหน้าเติมเงินทั้งหมดไว้
  
  11. lib\homepage\wash Folder นี้เก็บหน้าของ site และ machine ทั้งหมดไว้
  
    11.1 lib\homepage\wash\wash.dart file นี้คือหน้าของ site  
    
    11.2 lib\homepage\wash\washlaundry.dart file นี้คือหน้าของ machine แล้วการสั่ง
    
    11.3 lib\homepage\wash\washpromption.dart file นี้คือหน้าที่เก็บข้อมูลของ promotion  ไว้
    
  12. lib\homepage\bottomNavbar.dart นี้เก็บแทบ bottomNavbar ไว้
  
  13. lib\homepage\homepage.dart นี้คือหน้า homepage ของแอพ
