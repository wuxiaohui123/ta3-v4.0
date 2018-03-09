package com.yinhai.sysframework.util;

import java.util.ArrayList;
import java.util.List;

import com.yinhai.sysframework.menu.IMenu;

public class MenuTreeNode {

	private String id = null;
	private String pId = null;
	private String menuName = null;
	private String url = null;
	private String img = null;
	private String isShow = null;
	private Long nSeq = null;
	private List<MenuTreeNode> childNode = null;
	private MenuTreeNode parent = null;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

	public Long getnSeq() {
		return nSeq;
	}

	public void setnSeq(Long nSeq) {
		this.nSeq = nSeq;
	}

	public List<MenuTreeNode> getChildNode() {
		return childNode;
	}

	public void setChildNode(List<MenuTreeNode> childNode) {
		this.childNode = childNode;

		if (null != childNode) {
			int i = 0;
			for (int j = childNode.size(); i < j; i++) {
				MenuTreeNode t = childNode.get(i);
				t.setParent(this);
			}
		}
	}

	public MenuTreeNode getParent() {
		return parent;
	}

	public void setParent(MenuTreeNode parent) {
		this.parent = parent;
	}

	public MenuTreeNode(String id, String pId, String menuName, String url, String img, String isShow, Long nSeq) {
		this.id = id;
		this.pId = pId;
		this.menuName = menuName;
		this.url = url;
		this.img = img;
		this.isShow = isShow;
		this.nSeq = nSeq;
	}

	@SuppressWarnings("rawtypes")
	public static MenuTreeNode createTree(List list) {
		MenuTreeNode root = null;
		IMenu menu = null;
		String isShow = null;
		if (ValidateUtil.isNotEmpty(list)) {
			menu = ConvertUtil.ObjectToMenu(list.get(0));
			if (("3".equals(menu.getSecuritypolicy())) || ("2".equals(menu.getSecuritypolicy()))) {
				isShow = "hide";
			} else {
				isShow = "show";
			}
			root = new MenuTreeNode(menu.getMenuid().toString(), menu.getPmenuid().toString(), menu.getMenuname(), menu.getUrl(), menu.getIconSkin(),
					isShow, menu.getSortno());
			MenuTreeNode node = null;
			for (int j = 1; j < list.size(); j++) {
				menu = ConvertUtil.ObjectToMenu(list.get(j));
				if (("3".equals(menu.getSecuritypolicy())) || ("2".equals(menu.getSecuritypolicy()))) {
					isShow = "hide";
				} else {
					isShow = "show";
				}
				node = new MenuTreeNode(menu.getMenuid().toString(), menu.getPmenuid().toString(), menu.getMenuname(), menu.getUrl(),
						menu.getIconSkin(), isShow, menu.getSortno());
				root.insertNode(node);
				root = root.getRoot();
			}
		}
		return root;
	}

	

	private MenuTreeNode addChildNode(MenuTreeNode node) {
		if (null == childNode) {
			childNode = new ArrayList<MenuTreeNode>();
		}

		if (null == node.getMenuName()) {
			setChildNode(node.getChildNode());
			node.setParent(this);
		} else {
			childNode.add(node);
			node.setParent(this);
		}
		return this;
	}

	public MenuTreeNode getRoot() {
		MenuTreeNode t = this;
		while (null != t.getParent()) {
			t = t.getParent();
		}
		return t;
	}

	public boolean insertNode(MenuTreeNode node) {
		MenuTreeNode root = getRoot();

		if (root.getId().equals(node.getpId())) {
			root.addChildNode(node);

			node.setParent(root);
			return true;
		}

		if ((null != root.getpId()) && (root.getpId().equals(node.getId()))) {
			node.addChildNode(root);
			root.setParent(node);
			return true;
		}

		if (getId().equals(node.getpId())) {
			addChildNode(node);

			node.setParent(this);
			return true;
		}

		if ((null != getpId()) && (getpId().equals(node.getId()))) {
			node.addChildNode(this);
			setParent(node);
			return true;
		}

		if (null == childNode)
			childNode = new ArrayList<MenuTreeNode>();
		int i = 0;
		for (int j = childNode.size(); i < j; i++) {
			MenuTreeNode t1 = (MenuTreeNode) childNode.get(i);
			if (t1.insertNode(node)) {
				return true;
			}
		}
		return false;
	}
}
