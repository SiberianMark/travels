<?php
namespace Think;

/**
 * 单例类
 * @author mayongzhen
 * @date 2016-06-01
 */
abstract class Single
{
	/**
	 * 单例实例
	 *
	 * @var array
	 */
	private static $_instances = array();

	/**
	 * 获取单例
	 * @param string $class
	 *
	 * @return mixed
	 */
	public static function getInstance($class)
	{
		if (!isset(self::$_instances[$class])) {
			self::$_instances[$class] = new $class;
		}
		return self::$_instances[$class];
	}
}