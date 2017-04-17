<?php /* Smarty version Smarty-3.1.15, created on 2017-04-06 09:59:41
         compiled from "/opt/lbaw/lbaw1652/public_html/frmk/templates/common/menu_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:36313851958e6037d5f8910-44259914%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd56f6e911c96d642956b4a95142b0aff10845a85' => 
    array (
      0 => '/opt/lbaw/lbaw1652/public_html/frmk/templates/common/menu_logged_out.tpl',
      1 => 1386927924,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '36313851958e6037d5f8910-44259914',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_58e6037d604a37_52791340',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58e6037d604a37_52791340')) {function content_58e6037d604a37_52791340($_smarty_tpl) {?><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/users/register.php">Register</a>
<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users/login.php" method="post">
  <input type="text" placeholder="username" name="username">
  <input type="password" placeholder="password" name="password">
  <input type="submit" value=">">
</form>
<?php }} ?>
