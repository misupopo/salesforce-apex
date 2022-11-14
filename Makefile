USERNAME=$(shell jq -r .username env.json)

.PHONY: create-project
create-project: ## Create a new project
	sfdx force:project:create -n salesforce-apex

# URL はそのままで OK
.PHONY: sf-login
sf-login: ## sandbox 環境にログインします。
	sfdx force:auth:web:login -r https://test.salesforce.com -a sand1

.PHONY: sf-all-retrieve
sf-all-retrieve: ## 全ての Apex code を取得します。
	sfdx force:source:retrieve -x manifest/package.xml

# Apexクラス
# sfdx force:source:retrieve -m ApexClass -u sand1
# Lightning Auraコンポーネント
# sfdx force:source:retrieve -m AuraDefinitionBundle -u sand1
# Lightning Webコンポーネント
# sfdx force:source:retrieve -m LightningComponentBundle -u san1

.PHONY: sf-all-deploy
sf-all-deploy: ## 全ての Apex code をデプロイします。
	sfdx config:set defaultusername=$(USERNAME)

.PHONY: sf-all-deploy
sf-all-deploy: ## 全ての Apex code をデプロイします。
	sfdx force:source:deploy -x manifest/package.xml

# クラスのディレクトリが force-app になっているので、force-app ごとデプロイすると同期されるので削除ずみのクラスも sandbox 上から消える
.PHONY: sf-directory-deploy
sf-directory-deploy: ## ディレクトリ単位で Apex code をデプロイします。
	sfdx force:source:deploy -p force-app -u sand1

# See "Self-Documented Makefile" article
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
