<?php /* Smarty version Smarty-3.1.15, created on 2017-04-06 10:06:12
         compiled from "/opt/lbaw/lbaw1652/public_html/frmk/templates/common/menu_logged_in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:208712600558e60504cd76f2-12972636%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0783796fc4cc7662dd43c72360f25030e8c258e0' => 
    array (
      0 => '/opt/lbaw/lbaw1652/public_html/frmk/templates/common/menu_logged_in.tpl',
      1 => 1386927924,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '208712600558e60504cd76f2-12972636',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_58e60504e5af18_30420710',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58e60504e5af18_30420710')) {function content_58e60504e5af18_30420710($_smarty_tpl) {?><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users/logout.php">Logout</a>
<span class="username"><?php echo $_smarty_tpl->tpl_vars['USERNAME']->value;?>
</span>
<?php }} ?>
