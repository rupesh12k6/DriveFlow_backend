$path = "src/main/java/org/example/placement_drive_management/repository/ApplicationRepository.java"
$content = Get-Content $path
$content = $content -replace "Page<Applications> findByDrive_DriveId\(String driveId,Pageable pageable\);", "@Query(\"SELECT ap FROM Applications ap JOIN FETCH ap.student s JOIN FETCH ap.drive d JOIN FETCH d.company c WHERE d.driveId = :driveId\")`n    Page<Applications> findByDrive_DriveId(@Param(\"driveId\") String driveId, Pageable pageable);"
$content = $content -replace "Page<Applications> findByStudent_RollNo\(String rollNo, Pageable pageable\);", "@Query(\"SELECT ap FROM Applications ap JOIN FETCH ap.student s JOIN FETCH ap.drive d JOIN FETCH d.company c WHERE s.rollNo = :rollNo\")`n    Page<Applications> findByStudent_RollNo(@Param(\"rollNo\") String rollNo, Pageable pageable);"
Set-Content $path $content
