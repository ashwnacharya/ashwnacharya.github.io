#!/bin/bash

bundle exec jekyll build
tar -czvf site.tar.gz _site
scp -i ~/.ssh/personal_id_rsa site.tar.gz ashwnacharya@ashwnacharya.info:/data/releases/blog

FOLDER_NAME=`date +%s`

ssh -T -i ~/.ssh/personal_id_rsa ashwnacharya@ashwnacharya.info << EOF

    echo "Extracting the deployment"
    tar -xzvf /data/releases/blog/site.tar.gz --directory /data/releases/blog

    echo "Removing the deployment tar file"
    rm /data/releases/blog/site.tar.gz

    echo "Renaming to timestamped folder"
    mv /data/releases/blog/_site /data/releases/blog/$FOLDER_NAME

    echo "Updating the symlink"
    unlink /data/blog
    ln -sf /data/releases/blog/$FOLDER_NAME /data/blog

    sudo systemctl restart nginx
EOF

