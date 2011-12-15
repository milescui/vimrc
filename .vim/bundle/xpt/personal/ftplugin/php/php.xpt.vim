XPTemplate priority=personal

" ================================= Snippets ===================================
XPTemplateDef

" Yii framework sippets
XPT user hint=Yii:\ Yii::app\()->user->..
Yii::app()->user->`arg^

XPT params hint=Yii:\ Yii::app\()->params[..]
Yii::app()->params['`arg^']`cursor^

XPT session hint=Yii:\ Yii::app\()->session[..]
Yii::app()->session['`name^']`cursor^

XPT cookie hint=Yii:\ Yii::app\()->request->cookies[..]
Yii::app()->request->cookies['`name^']`cursor^

XPT getPost hint=Yii:\ Yii::app\()->request->getPost\(..)
Yii::app()->request->getPost('`name^'`, defaultValue^)`cursor^

XPT getQuery hint=Yii:\ Yii::app\()->request->getQuery\(..)
Yii::app()->request->getQuery('`name^'`, defaultValue^)`cursor^

XPT getParam hint=Yii:\ Yii::app\()->request->getParam\(..)
Yii::app()->request->getParam('`name^'`, defaultValue^)`cursor^

XPT r hint=Yii:\ \$this->render\(..)
$this->render('`view^', `data^);`cursor^

XPT rp hint=Yii:\ \$this->renderPartial\(..)
$this->renderPartial('`view^', `data^);`cursor^

XPT rd hint=Yii:\ \$this->redirect\(..)
$this->redirect(array('`controller^/`action^'));`cursor^

XPT rf hint=Yii:\ \$this->refresh\()
$this->refresh();`cursor^

XPT find hint=Yii:\ Model::model\()->find\(..)
`ModelName^::model()->find('`condition^', `params^)`cursor^

XPT findByPk hint=Yii:\ Model::model\()->findByPk\(..)
`ModelName^::model()->findByPk(`pk^)`cursor^

XPT findBySql hint=Yii:\ Model::model\()->findBySql\(..)
`ModelName^::model()->findBySql('`sql^', `params^)`cursor^

XPT findAll hint=Yii:\ Model::model\()->findAll\(..)
`ModelName^::model()->findAll('`condition^', `params^)`cursor^

XPT findAllBySql hint=Yii:\ Model::model\()->findAllBySql\(..)
`ModelName^::model()->findAllBySql('`sql^', `params^)`cursor^
