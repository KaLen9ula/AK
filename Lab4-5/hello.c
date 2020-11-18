#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/printk.h>


MODULE_AUTHOR("Andrukhovych Mykola IO-81");
MODULE_DESCRIPTION("Hello world printing Linux module for lab5");
MODULE_LICENSE("Dual BSD/GPL");

static int amount = 1;
module_param(amount, uint, S_IRUGO);
MODULE_PARM_DESC(times, "Amount of outputting Hello worlds");

static int __init thisinit(void)
{
  uint i = 0;

  if(amount == 0)
  {
    printk(KERN_WARNING "Entered parameter equals 0");
  } 
  else if(amount >= 5 && amount <= 10) 
  {
    printk(KERN_WARNING "Entered parameter is between 5 and 10");
  } 
  else if(amount > 10)
  {
    printk(KERN_ERR "Entered parameter is bigger than 10");
    return -EINVAL;
  }

  for(i=0; i<amount; i++)
  {
    printk(KERN_EMERG "Hello, world!\n");
  }

  printk(KERN_INFO "Amount: %d\n", amount);

  return 0;
}

static void __exit thisexit(void)
{
  /* Do nothing here right now */
}

module_init(thisinit);
module_exit(thisexit);
