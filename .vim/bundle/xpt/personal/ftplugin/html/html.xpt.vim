XPTemplate priority=personal

" ================================= Snippets ===================================
XPTemplateDef

" php snippets in html file
XPT echo hint=<?php\ echo\ ..\ ?>
<?php echo `arg^ ?>`cursor^

XPT foreach hint=<?php\ foreach\ ..\ ?>
<?php foreach (`collection^ as `item^): ?>
`cursor^
<?php endforeach ?>

XPT if hint=<?php\ if\ ..\ ?>
<?php if (`condition^): ?>
`cursor^
<?php endif ?>

XPT ifelse hint=<?php\ if\ ..\ else\ ..\ ?>
<?php if (`condition^): ?>
`iflogic^
<?php else: ?>
`elselogic^
<?php endif ?>
`cursor^

XPT url hint=<?php\ echo\ $this->createUrl\ ..\ ?>
<?php echo $this->createUrl('`controller^/`action^') ?>`cursor^
