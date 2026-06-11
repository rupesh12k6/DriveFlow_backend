$path = "src/main/java/org/example/placement_drive_management/service/Impl/StudentProfileServiceImpl.java"
$content = Get-Content $path
$content = $content -replace "import jakarta.transaction.Transactional;", "import org.springframework.transaction.annotation.Transactional;"
$content = $content -replace "@org.springframework.transaction.annotation.Transactional\(readOnly = true\)", "@Transactional(readOnly = true)"
Set-Content $path $content
