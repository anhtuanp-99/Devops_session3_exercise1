#!/bin/bash

echo "--- Bắt đầu thiết lập không gian làm việc cho Rikkei LMS ---"

# 1. Tạo user rikkeilms (nếu chưa tồn tại)
if id -u rikkeilms > /dev/null 2>&1; then
    echo "User 'rikkeilms' đã tồn tại."
else
    echo "Đang tạo user 'rikkeilms'..."
    sudo useradd rikkeilms
fi

# 2. Tạo thư mục gốc
echo "Đang tạo thư mục /opt/rikkei/course-service..."
sudo mkdir -p /opt/rikkei/course-service

# 3. Chuyển quyền sở hữu cho user và group rikkeilms
echo "Đang chuyển quyền sở hữu..."
sudo chown -R rikkeilms:rikkeilms /opt/rikkei/course-service

# 4. Cấp quyền: Chủ sở hữu có quyền ghi + thực thi (drwxr-xr-x = 755)
echo "Đang thiết lập phân quyền 755..."
sudo chmod 755 /opt/rikkei/course-service

# 5. Kiểm tra kết quả
echo "--- Kết quả kiểm tra ---"
ls -ld /opt/rikkei/course-service
