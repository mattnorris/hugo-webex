build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://hugo-webex --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E2X4FY0AJKZA67 --paths '/*'
