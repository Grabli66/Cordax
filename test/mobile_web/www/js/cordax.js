// Generated by Haxe 4.0.0-preview.4+1e3e5e0
(function ($global) { "use strict";
var $hxEnums = {};
function $extend(from, fields) {
	function Inherit() {} Inherit.prototype = from; var proto = new Inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var HxOverrides = function() { };
HxOverrides.__name__ = ["HxOverrides"];
HxOverrides.iter = function(a) {
	return { cur : 0, arr : a, hasNext : function() {
		return this.cur < this.arr.length;
	}, next : function() {
		return this.arr[this.cur++];
	}};
};
Math.__name__ = ["Math"];
var StringTools = function() { };
StringTools.__name__ = ["StringTools"];
StringTools.hex = function(n,digits) {
	var s = "";
	var hexChars = "0123456789ABCDEF";
	while(true) {
		s = hexChars.charAt(n & 15) + s;
		n >>>= 4;
		if(!(n > 0)) {
			break;
		}
	}
	if(digits != null) {
		while(s.length < digits) s = "0" + s;
	}
	return s;
};
var Type = function() { };
Type.__name__ = ["Type"];
Type.getClassName = function(c) {
	var a = c.__name__;
	if(a == null) {
		return null;
	}
	return a.join(".");
};
var cordax_Cordax = function() { };
cordax_Cordax.__name__ = ["cordax","Cordax"];
cordax_Cordax.registerViewElement = function(view,element) {
	var k = view.id;
	var _this = cordax_Cordax.views;
	if(__map_reserved[k] != null) {
		_this.setReserved(k,element);
	} else {
		_this.h[k] = element;
	}
};
cordax_Cordax.run = function(view) {
	cordax_Cordax.render = new cordax_native_render_html_HtmlRender();
	var root = view.toElement();
	cordax_Cordax.render.render(root);
};
cordax_Cordax.partialRender = function(view) {
	var key = view.id;
	var _this = cordax_Cordax.views;
	var oldElement = __map_reserved[key] != null ? _this.getReserved(key) : _this.h[key];
	var newElement = view.toElement();
	cordax_Cordax.render.replace(oldElement,newElement);
};
cordax_Cordax.renderDialog = function(settings) {
	cordax_Cordax.render.renderDialog(settings.builder().toElement(),settings.onClose);
};
cordax_Cordax.closeDialog = function() {
	cordax_Cordax.render.closeDialog();
};
cordax_Cordax.setTitle = function(title) {
	window.document.getElementsByTagName("title")[0].innerText = title;
};
var cordax_native_elements_Builder = function() { };
cordax_native_elements_Builder.__name__ = ["cordax","native","elements","Builder"];
cordax_native_elements_Builder.root = function(settings) {
	var res = new cordax_native_elements_RootElement(settings.view,settings.attachment,settings.isContainer);
	return res;
};
cordax_native_elements_Builder.text = function(settings) {
	var res = new cordax_native_elements_TextElement(settings.name);
	res.text = settings.text;
	return res;
};
var cordax_native_elements_Element = function(name) {
	this.css = [];
	this.name = name;
};
cordax_native_elements_Element.__name__ = ["cordax","native","elements","Element"];
cordax_native_elements_Element.prototype = {
	update: function() {
		if(this.nativeData == null) {
			console.log("src/cordax/native/elements/Element.hx:58:",this);
		}
		this.nativeData.render.update(this);
	}
	,__class__: cordax_native_elements_Element
};
var cordax_native_elements_ImageElement = function(name,src) {
	cordax_native_elements_Element.call(this,name);
	this.src = src;
};
cordax_native_elements_ImageElement.__name__ = ["cordax","native","elements","ImageElement"];
cordax_native_elements_ImageElement.__super__ = cordax_native_elements_Element;
cordax_native_elements_ImageElement.prototype = $extend(cordax_native_elements_Element.prototype,{
	__class__: cordax_native_elements_ImageElement
});
var cordax_native_elements_LayoutElement = function(name) {
	this.childArray = [];
	cordax_native_elements_Element.call(this,name);
};
cordax_native_elements_LayoutElement.__name__ = ["cordax","native","elements","LayoutElement"];
cordax_native_elements_LayoutElement.__super__ = cordax_native_elements_Element;
cordax_native_elements_LayoutElement.prototype = $extend(cordax_native_elements_Element.prototype,{
	get_childs: function() {
		return HxOverrides.iter(this.childArray);
	}
	,addChild: function(child) {
		this.childArray.push(child);
	}
	,__class__: cordax_native_elements_LayoutElement
});
var cordax_native_elements_RootElement = function(view,attachment,isContainer) {
	if(isContainer == null) {
		isContainer = false;
	}
	this.attachment = attachment;
	this.viewId = view.id;
	this.isContainer = isContainer;
	cordax_native_elements_Element.call(this,view.get_name());
	cordax_Cordax.registerViewElement(view,this);
};
cordax_native_elements_RootElement.__name__ = ["cordax","native","elements","RootElement"];
cordax_native_elements_RootElement.__super__ = cordax_native_elements_Element;
cordax_native_elements_RootElement.prototype = $extend(cordax_native_elements_Element.prototype,{
	__class__: cordax_native_elements_RootElement
});
var cordax_native_elements_TextElement = function(name) {
	cordax_native_elements_Element.call(this,name);
};
cordax_native_elements_TextElement.__name__ = ["cordax","native","elements","TextElement"];
cordax_native_elements_TextElement.__super__ = cordax_native_elements_Element;
cordax_native_elements_TextElement.prototype = $extend(cordax_native_elements_Element.prototype,{
	__class__: cordax_native_elements_TextElement
});
var cordax_native_render_IRender = function() { };
cordax_native_render_IRender.__name__ = ["cordax","native","render","IRender"];
cordax_native_render_IRender.prototype = {
	__class__: cordax_native_render_IRender
};
var cordax_native_render_html_ViewPair = function(view,element) {
	this.view = view;
	this.element = element;
};
cordax_native_render_html_ViewPair.__name__ = ["cordax","native","render","html","ViewPair"];
cordax_native_render_html_ViewPair.prototype = {
	__class__: cordax_native_render_html_ViewPair
};
var cordax_native_render_html_HtmlRender = function() {
};
cordax_native_render_html_HtmlRender.__name__ = ["cordax","native","render","html","HtmlRender"];
cordax_native_render_html_HtmlRender.__interfaces__ = [cordax_native_render_IRender];
cordax_native_render_html_HtmlRender.prototype = {
	applyToHtmlElement: function(element,htmlElement) {
		var elementName = element.name.toLowerCase();
		htmlElement.classList.add(elementName);
		var _g = 0;
		var _g1 = element.css;
		while(_g < _g1.length) {
			var css = _g1[_g];
			++_g;
			htmlElement.classList.add(css);
		}
		if((element instanceof cordax_native_elements_TextElement)) {
			var textElement = element;
			if(textElement.text != null) {
				htmlElement.innerText = textElement.text;
			}
		} else if((element instanceof cordax_native_elements_ImageElement)) {
			var imgElement = element;
			if(imgElement.src != null) {
				htmlElement.setAttribute("src",imgElement.src);
			}
		}
		if(element.onClick != null) {
			htmlElement.onclick = element.onClick;
		}
		element.nativeData = { render : this, nativeElement : htmlElement};
	}
	,renderElement: function(element) {
		if((element instanceof cordax_native_elements_RootElement)) {
			var rootElement = element;
			var rootContainer = null;
			if(rootElement.isContainer) {
				rootContainer = window.document.createElement("div");
				this.applyToHtmlElement(rootElement,rootContainer);
				if(rootElement.attachment != null) {
					var childElement = this.renderElement(rootElement.attachment);
					if(childElement != null) {
						this.applyToHtmlElement(rootElement.attachment,childElement);
						rootContainer.appendChild(childElement);
					}
				}
			} else if(rootElement.attachment != null) {
				rootContainer = this.renderElement(rootElement.attachment);
				if(rootContainer != null) {
					this.applyToHtmlElement(rootElement.attachment,rootContainer);
				}
			}
			return rootContainer;
		} else if((element instanceof cordax_native_elements_LayoutElement)) {
			var rootContainer1 = window.document.createElement("div");
			var layoutElement = element;
			var child = layoutElement.get_childs();
			while(child.hasNext()) {
				var child1 = child.next();
				var childElement1 = this.renderElement(child1);
				if(childElement1 != null) {
					this.applyToHtmlElement(child1,childElement1);
					rootContainer1.appendChild(childElement1);
				}
			}
			return rootContainer1;
		} else if((element instanceof cordax_native_elements_TextElement)) {
			var textChild = window.document.createElement("div");
			this.applyToHtmlElement(element,textChild);
			return textChild;
		}
		return null;
	}
	,appendBaseStyles: function() {
		var styleNode = window.document.createElement("style");
		styleNode.type = "text/css";
		styleNode.textContent = "html, body {\r\n    width: 100%;\r\n    height: 100%;\r\n    padding: 0;\r\n    margin: 0;\r\n    overflow: hidden;\r\n}\r\n\r\n.application {\r\n    width: 100%;\r\n    height: 100%;\r\n}\r\n\r\n#dialogs .overlay {\r\n    top:0;\r\n    left: 0;\r\n    z-index: 1;\r\n    position: fixed;\r\n    background: #aaaaaa33;\r\n    width: 100%;\r\n    height: 100%;\r\n    overflow: hidden;\r\n}\r\n\r\n#dialogs .simpledialog {\r\n    position: absolute;\r\n    z-index: 2;\r\n    top: 50%;\r\n    left: 50%;\r\n    width: 500px;\r\n    margin-top: -250px;\r\n    margin-left: -250px;\r\n    background-color: #fefefe;\r\n    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);\r\n    padding-bottom: 10px;\r\n}\r\n\r\n#dialogs .simpledialog .header {\r\n    display: flex;\r\n    flex-direction: row;\r\n    flex: 1;\r\n    align-items: center;\r\n    height: 56px;\r\n    background-color: #0978a4;\r\n    color: #fff;\r\n}\r\n\r\n#dialogs .simpledialog .header .title {\r\n    padding-left: 1em;\r\n}\r\n\r\n.flex-1 {\r\n    display: flex;\r\n    flex: 1;\r\n}\r\n\r\n.column {\r\n    display: flex;\r\n    flex-direction: column;\r\n}\r\n\r\n.row {\r\n    display: flex;\r\n    flex-direction: row;\r\n}\r\n\r\n.container {\r\n    display: flex;\r\n}\r\n\r\n.padding {\r\n    display: flex;\r\n}\r\n\r\n.center {\r\n    align-items: center;\r\n    flex: 1;\r\n    justify-content: center;\r\n    display: flex;\r\n}\r\n\r\n.appbar {\r\n    background-color: #1B5E20;\r\n    display: flex;\r\n    flex-direction: row;\r\n    height: 3.6em;\r\n    color: #fff;\r\n    align-items: center;\r\n}\r\n\r\n.appbar .title {\r\n    \r\n}\r\n\r\n.drawer {\r\n    position: absolute;\r\n    display: flex;\r\n    top: 0;\r\n    left: 0;\r\n    width: 100%;\r\n    height: 100%;\r\n}\r\n\r\n.drawer .overflow {\r\n    flex: 1;\r\n    background-color: #ffffffAA;\r\n}\r\n\r\n\r\n.icon-button {\r\n    cursor: pointer;\r\n    padding: 6px;\r\n    width: 20px;\r\n    height: 20px;\r\n}\r\n\r\n.icon-button:hover {\r\n    border: none;\r\n    border-radius: 14px;\r\n    background: #00000033;\r\n}\r\n\r\n.circle-avatar {\r\n    border-radius: 50%;\r\n    overflow: hidden;\r\n}\r\n\r\n.image {\r\n    width: 100%;\r\n}\r\n\r\n.drawer-simple-header {\r\n    display: flex;\r\n    background-color: #1B5E20;\r\n    border-bottom: 1px solid #ddd;\r\n    color: #fff;\r\n    height: 10em;\r\n}\r\n\r\n/*\r\n.scaffold {\r\n    display: flex;\r\n    flex-direction: column;\r\n    width: 100%;\r\n    height: 100%;\r\n}\r\n\r\n.scaffold .app-bar {\r\n    background-color: #1B5E20;\r\n    display: flex;\r\n    flex-direction: row;\r\n    height: 3.6em;   \r\n    justify-content: space-between;\r\n    align-items: center;\r\n    color: #fff;\r\n}\r\n\r\n.scaffold .app-bar .leading {\r\n    margin-left: 16px;  \r\n}\r\n\r\n.scaffold .app-bar .actions { \r\n    margin-right: 16px;  \r\n}\r\n\r\n.drawer {\r\n    position: absolute;\r\n    display: flex;\r\n    top: 0;\r\n    left: 0;\r\n    width: 100%;\r\n    height: 100%;    \r\n}\r\n\r\n.drawer .content {\r\n    flex: 0;\r\n    min-width: 250px;\r\n    background-color: #fff;\r\n}\r\n\r\n.drawer .overflow {\r\n    flex: 1;\r\n    background-color: #ffffffAA;\r\n}\r\n\r\n.drawer-simple-header {\r\n    background-color: #1B5E20;\r\n    border-bottom: 1px solid #ddd;\r\n}\r\n\r\n.drawer-simple-header .inner {\r\n    padding: 16px;\r\n}\r\n\r\n.drawer-simple-header .panel {\r\n    display: flex;\r\n    flex-direction: row;\r\n}\r\n\r\n.drawer-simple-header .photo {\r\n    flex: 0;\r\n    width: 48px;\r\n    height: 48px;\r\n    border-radius: 24px;    \r\n    margin-bottom: 16px;\r\n}\r\n\r\n.drawer-simple-header .action-panel {\r\n    flex: 1;\r\n    display: flex;\r\n    flex-direction: row;\r\n    justify-content: flex-end;\r\n}\r\n\r\n.drawer-simple-header .action-panel .action {\r\n    width: 20px;\r\n    height: 20px;\r\n    padding: 5px;\r\n    margin-left: 4px;\r\n}\r\n\r\n.drawer-simple-header .action-panel .action:hover {\r\n    cursor: pointer;\r\n    background: #1B5120;\r\n    border-radius: 24px;\r\n}\r\n\r\n.drawer-simple-header .name {\r\n    font-weight: bold;\r\n    font-size: 16pt;    \r\n    padding-bottom: 2px;\r\n    color: #fff;\r\n}\r\n\r\n.drawer-simple-header .email {    \r\n    font-size: 10pt;\r\n    color: #fff;\r\n    margin-bottom: 8px;    \r\n}\r\n\r\n.circle-avatar {\r\n    border-radius: 50%;\r\n    overflow: hidden;\r\n}\r\n\r\n.list-view-simple-item {\r\n    display: flex;\r\n    flex-direction: row;\r\n    align-items: center;\r\n} */";
		window.document.body.appendChild(styleNode);
	}
	,render: function(root) {
		console.log("src/cordax/native/render/html/HtmlRender.hx:133:","RENDER");
		window.document.body.innerHTML = "";
		this.dialogElement = null;
		var rootElement = this.renderElement(root);
		this.appendBaseStyles();
		window.document.body.appendChild(rootElement);
	}
	,renderDialog: function(root,onClose) {
		var _gthis = this;
		console.log("src/cordax/native/render/html/HtmlRender.hx:148:","RENDER DIALOG");
		if(this.dialogElement != null) {
			this.dialogElement.remove();
		}
		this.dialogElement = window.document.createElement("div");
		this.dialogElement.id = "dialogs";
		window.document.body.appendChild(this.dialogElement);
		var overlay = window.document.createElement("div");
		overlay.className = "overlay";
		overlay.onclick = function() {
			onClose();
			_gthis.dialogElement.remove();
			return;
		};
		this.dialogElement.appendChild(overlay);
		var rootElement = this.renderElement(root);
		this.dialogElement.appendChild(rootElement);
	}
	,closeDialog: function() {
		if(this.dialogElement != null) {
			this.dialogElement.remove();
		}
	}
	,update: function(element) {
		console.log("src/cordax/native/render/html/HtmlRender.hx:181:","UPDATE");
		var htmlElement = element.nativeData.nativeElement;
		this.applyToHtmlElement(element,htmlElement);
	}
	,replace: function(oldElement,newElement) {
		console.log("src/cordax/native/render/html/HtmlRender.hx:190:","REPLACE");
		var htmlElement = oldElement.nativeData.nativeElement;
		var parent = htmlElement.parentElement;
		var rootElement = this.renderElement(newElement);
		parent.replaceChild(rootElement,htmlElement);
	}
	,__class__: cordax_native_render_html_HtmlRender
};
var cordax_ui_View = function() {
	this.id = cordax_util_Guid.generate();
};
cordax_ui_View.__name__ = ["cordax","ui","View"];
cordax_ui_View.prototype = {
	get_name: function() {
		var fullName = Type.getClassName(js_Boot.getClass(this));
		var items = fullName.split(".");
		return items[items.length - 1];
	}
	,setState: function() {
		cordax_Cordax.partialRender(this);
	}
	,showDialog: function(settings) {
		cordax_Cordax.renderDialog(settings);
	}
	,render: function() {
		return null;
	}
	,toElement: function() {
		var attachElement = null;
		var attachView = this.render();
		if(attachView != null) {
			attachElement = attachView.toElement();
		}
		var root = new cordax_native_elements_RootElement(this,attachElement);
		return root;
	}
	,__class__: cordax_ui_View
};
var cordax_ui_App = function() {
	cordax_ui_View.call(this);
};
cordax_ui_App.__name__ = ["cordax","ui","App"];
cordax_ui_App.__super__ = cordax_ui_View;
cordax_ui_App.prototype = $extend(cordax_ui_View.prototype,{
	toElement: function() {
		var child = this.render();
		var childElement = null;
		if(child != null) {
			childElement = child.toElement();
		}
		var res = new cordax_native_elements_RootElement(this,childElement,true);
		res.css.push("application");
		return res;
	}
	,__class__: cordax_ui_App
});
var cordax_ui_AppBar = function(settings) {
	cordax_ui_View.call(this);
	this.settings = settings;
};
cordax_ui_AppBar.__name__ = ["cordax","ui","AppBar"];
cordax_ui_AppBar.__super__ = cordax_ui_View;
cordax_ui_AppBar.prototype = $extend(cordax_ui_View.prototype,{
	toElement: function() {
		var layout = new cordax_native_elements_LayoutElement(this.get_name());
		var res = new cordax_native_elements_RootElement(this,layout);
		if(this.settings != null) {
			if(this.settings.title != null) {
				var titleElement = this.settings.title.toElement();
				layout.addChild(titleElement);
			}
		}
		return res;
	}
	,__class__: cordax_ui_AppBar
});
var cordax_ui_Button = function(settings) {
	cordax_ui_View.call(this);
	this.settings = settings;
};
cordax_ui_Button.__name__ = ["cordax","ui","Button"];
cordax_ui_Button.__super__ = cordax_ui_View;
cordax_ui_Button.prototype = $extend(cordax_ui_View.prototype,{
	toElement: function() {
		var textElement = new cordax_native_elements_TextElement("text");
		textElement.text = this.settings.text;
		textElement.onClick = this.settings.onClick;
		var res = new cordax_native_elements_RootElement(this,textElement);
		return res;
	}
	,__class__: cordax_ui_Button
});
var cordax_ui_Dialog = function() {
	cordax_ui_View.call(this);
};
cordax_ui_Dialog.__name__ = ["cordax","ui","Dialog"];
cordax_ui_Dialog.__super__ = cordax_ui_View;
cordax_ui_Dialog.prototype = $extend(cordax_ui_View.prototype,{
	__class__: cordax_ui_Dialog
});
var cordax_ui_SimpleDialog = function(settings) {
	cordax_ui_Dialog.call(this);
	this.settings = settings;
};
cordax_ui_SimpleDialog.__name__ = ["cordax","ui","SimpleDialog"];
cordax_ui_SimpleDialog.__super__ = cordax_ui_Dialog;
cordax_ui_SimpleDialog.prototype = $extend(cordax_ui_Dialog.prototype,{
	toElement: function() {
		var layout = new cordax_native_elements_LayoutElement(this.get_name());
		var res = new cordax_native_elements_RootElement(this,layout);
		var header = new cordax_native_elements_LayoutElement("header");
		var title = this.settings.title.toElement();
		title.css.push("title");
		header.addChild(title);
		var closeButton = new cordax_native_elements_ImageElement("close","img/menu.svg");
		closeButton.onClick = function() {
			cordax_Cordax.closeDialog();
			return;
		};
		header.addChild(closeButton);
		layout.addChild(header);
		var content = this.settings.content.toElement();
		layout.addChild(content);
		return res;
	}
	,__class__: cordax_ui_SimpleDialog
});
var cordax_ui_ListItem = function(value) {
	this.id = cordax_util_Guid.generate();
	this.value = value;
};
cordax_ui_ListItem.__name__ = ["cordax","ui","ListItem"];
cordax_ui_ListItem.prototype = {
	__class__: cordax_ui_ListItem
};
var cordax_ui_IListDataSource = function() { };
cordax_ui_IListDataSource.__name__ = ["cordax","ui","IListDataSource"];
cordax_ui_IListDataSource.prototype = {
	__class__: cordax_ui_IListDataSource
};
var cordax_ui_ListDataSource = function(items) {
	this.items = items;
};
cordax_ui_ListDataSource.__name__ = ["cordax","ui","ListDataSource"];
cordax_ui_ListDataSource.__interfaces__ = [cordax_ui_IListDataSource];
cordax_ui_ListDataSource.fromArray = function(data) {
	var res = [];
	var _g = 0;
	while(_g < data.length) {
		var item = data[_g];
		++_g;
		res.push(new cordax_ui_ListItem(item));
	}
	return new cordax_ui_ListDataSource(res);
};
cordax_ui_ListDataSource.prototype = {
	getData: function() {
		return this.items;
	}
	,__class__: cordax_ui_ListDataSource
};
var cordax_ui_ListView = function(settings) {
	cordax_ui_View.call(this);
	this.settings = settings;
};
cordax_ui_ListView.__name__ = ["cordax","ui","ListView"];
cordax_ui_ListView.__super__ = cordax_ui_View;
cordax_ui_ListView.prototype = $extend(cordax_ui_View.prototype,{
	toElement: function() {
		var attachElement = new cordax_native_elements_LayoutElement("listview-content");
		var root = new cordax_native_elements_RootElement(this,attachElement,true);
		var items = this.settings.source.getData();
		var _g = 0;
		while(_g < items.length) {
			var item = items[_g];
			++_g;
			var child = this.settings.builder(item);
			attachElement.addChild(child.toElement());
		}
		return root;
	}
	,__class__: cordax_ui_ListView
});
var cordax_ui_Scaffold = function(settings) {
	cordax_ui_View.call(this);
	this.settings = settings;
};
cordax_ui_Scaffold.__name__ = ["cordax","ui","Scaffold"];
cordax_ui_Scaffold.__super__ = cordax_ui_View;
cordax_ui_Scaffold.prototype = $extend(cordax_ui_View.prototype,{
	toElement: function() {
		cordax_Cordax.setTitle(this.settings.title);
		var layout = new cordax_native_elements_LayoutElement(this.get_name());
		var res = new cordax_native_elements_RootElement(this,layout,false);
		if(this.settings.appBar != null) {
			var appbarElement = this.settings.appBar.toElement();
			layout.addChild(appbarElement);
		}
		var content = this.settings.content.toElement();
		layout.addChild(content);
		return res;
	}
	,__class__: cordax_ui_Scaffold
});
var cordax_ui_ViewModel = function() {
	this.changed = new haxe_ds_StringMap();
};
cordax_ui_ViewModel.__name__ = ["cordax","ui","ViewModel"];
cordax_ui_ViewModel.prototype = {
	notify: function(name,value) {
		var v = value;
		var _this = this.changed;
		var value1 = v;
		if(__map_reserved[name] != null) {
			_this.setReserved(name,value1);
		} else {
			_this.h[name] = value1;
		}
		this.isDirty = true;
	}
	,apply: function() {
		if(this.onChange != null && this.isDirty) {
			this.onChange(this.changed);
			this.isDirty = false;
		}
	}
	,__class__: cordax_ui_ViewModel
};
var cordax_ui_TextModel = function() {
	cordax_ui_ViewModel.call(this);
};
cordax_ui_TextModel.__name__ = ["cordax","ui","TextModel"];
cordax_ui_TextModel.__super__ = cordax_ui_ViewModel;
cordax_ui_TextModel.prototype = $extend(cordax_ui_ViewModel.prototype,{
	set_text: function(value) {
		this.notify("text",value);
		return this.text = value;
	}
	,__class__: cordax_ui_TextModel
});
var cordax_ui_Text = function(settings) {
	var _gthis = this;
	cordax_ui_View.call(this);
	this.settings = settings;
	if(this.settings.model != null) {
		this.settings.model.onChange = function(changed) {
			if(_gthis.textElement == null) {
				return;
			}
			var changeKey = changed.keys();
			while(changeKey.hasNext()) {
				var changeKey1 = changeKey.next();
				var value = __map_reserved[changeKey1] != null ? changed.getReserved(changeKey1) : changed.h[changeKey1];
				if(changeKey1 == "text") {
					_gthis.textElement.text = value;
				}
			}
			_gthis.textElement.update();
			return;
		};
	}
};
cordax_ui_Text.__name__ = ["cordax","ui","Text"];
cordax_ui_Text.__super__ = cordax_ui_View;
cordax_ui_Text.prototype = $extend(cordax_ui_View.prototype,{
	toElement: function() {
		return cordax_native_elements_Builder.root({ view : this, attachment : this.textElement = cordax_native_elements_Builder.text({ name : "text", text : this.settings.text})});
	}
	,__class__: cordax_ui_Text
});
var cordax_ui_layouts_Column = function(settings) {
	cordax_ui_View.call(this);
	this.settings = settings;
};
cordax_ui_layouts_Column.__name__ = ["cordax","ui","layouts","Column"];
cordax_ui_layouts_Column.__super__ = cordax_ui_View;
cordax_ui_layouts_Column.prototype = $extend(cordax_ui_View.prototype,{
	toElement: function() {
		var layout = new cordax_native_elements_LayoutElement(this.get_name());
		var res = new cordax_native_elements_RootElement(this,layout);
		var _g = 0;
		var _g1 = this.settings.childs;
		while(_g < _g1.length) {
			var child = _g1[_g];
			++_g;
			layout.addChild(child.toElement());
		}
		return res;
	}
	,__class__: cordax_ui_layouts_Column
});
var cordax_ui_layouts_Row = function(settings) {
	cordax_ui_View.call(this);
	this.settings = settings;
};
cordax_ui_layouts_Row.__name__ = ["cordax","ui","layouts","Row"];
cordax_ui_layouts_Row.__super__ = cordax_ui_View;
cordax_ui_layouts_Row.prototype = $extend(cordax_ui_View.prototype,{
	toElement: function() {
		var layout = new cordax_native_elements_LayoutElement(this.get_name());
		var res = new cordax_native_elements_RootElement(this,layout);
		var _g = 0;
		var _g1 = this.settings.childs;
		while(_g < _g1.length) {
			var child = _g1[_g];
			++_g;
			layout.addChild(child.toElement());
		}
		return res;
	}
	,__class__: cordax_ui_layouts_Row
});
var cordax_util_Guid = function() { };
cordax_util_Guid.__name__ = ["cordax","util","Guid"];
cordax_util_Guid.generate = function() {
	var result = "";
	var _g = 0;
	while(_g < 32) {
		var j = _g++;
		if(j == 8 || j == 12 || j == 16 || j == 20) {
			result += "-";
		}
		result += StringTools.hex(Math.floor(Math.random() * 16));
	}
	return result.toUpperCase();
};
var cordax_util_FileUtil = function() { };
cordax_util_FileUtil.__name__ = ["cordax","util","FileUtil"];
var haxe_IMap = function() { };
haxe_IMap.__name__ = ["haxe","IMap"];
var haxe_ds_StringMap = function() {
	this.h = { };
};
haxe_ds_StringMap.__name__ = ["haxe","ds","StringMap"];
haxe_ds_StringMap.__interfaces__ = [haxe_IMap];
haxe_ds_StringMap.prototype = {
	setReserved: function(key,value) {
		if(this.rh == null) {
			this.rh = { };
		}
		this.rh["$" + key] = value;
	}
	,getReserved: function(key) {
		if(this.rh == null) {
			return null;
		} else {
			return this.rh["$" + key];
		}
	}
	,keys: function() {
		return HxOverrides.iter(this.arrayKeys());
	}
	,arrayKeys: function() {
		var out = [];
		for( var key in this.h ) {
		if(this.h.hasOwnProperty(key)) {
			out.push(key);
		}
		}
		if(this.rh != null) {
			for( var key in this.rh ) {
			if(key.charCodeAt(0) == 36) {
				out.push(key.substr(1));
			}
			}
		}
		return out;
	}
	,__class__: haxe_ds_StringMap
};
var js_Boot = function() { };
js_Boot.__name__ = ["js","Boot"];
js_Boot.getClass = function(o) {
	if((o instanceof Array) && o.__enum__ == null) {
		return Array;
	} else {
		var cl = o.__class__;
		if(cl != null) {
			return cl;
		}
		var name = js_Boot.__nativeClassName(o);
		if(name != null) {
			return js_Boot.__resolveNativeClass(name);
		}
		return null;
	}
};
js_Boot.__nativeClassName = function(o) {
	var name = js_Boot.__toStr.call(o).slice(8,-1);
	if(name == "Object" || name == "Function" || name == "Math" || name == "JSON") {
		return null;
	}
	return name;
};
js_Boot.__resolveNativeClass = function(name) {
	return $global[name];
};
var mobile_$web_MyApp = function() {
	cordax_ui_App.call(this);
	this.count = 1;
	this.textModel = new cordax_ui_TextModel();
};
mobile_$web_MyApp.__name__ = ["mobile_web","MyApp"];
mobile_$web_MyApp.__super__ = cordax_ui_App;
mobile_$web_MyApp.prototype = $extend(cordax_ui_App.prototype,{
	render: function() {
		var _gthis = this;
		this.caption = "Clicked: " + this.count;
		return new cordax_ui_Scaffold({ title : "App", appBar : new cordax_ui_AppBar({ title : new cordax_ui_Text({ text : "Test app"})}), content : new cordax_ui_layouts_Column({ childs : [new cordax_ui_Text({ model : this.textModel, text : this.caption}),new cordax_ui_Button({ text : "Click me!", onClick : function() {
			_gthis.count += 1;
			_gthis.caption = "Clicked: " + _gthis.count;
			_gthis.textModel.set_text("Clicked: " + _gthis.count);
			_gthis.textModel.apply();
			_gthis.setState();
			return;
		}}),new cordax_ui_ListView({ builder : function(item) {
			return new cordax_ui_Text({ text : item.value});
		}, source : cordax_ui_ListDataSource.fromArray([1,2,3,4,5])})]})});
	}
	,__class__: mobile_$web_MyApp
});
var mobile_$web_Main = function() {
};
mobile_$web_Main.__name__ = ["mobile_web","Main"];
mobile_$web_Main.main = function() {
	var app = new mobile_$web_Main();
	app.start();
};
mobile_$web_Main.prototype = {
	render: function() {
		cordax_Cordax.run(new mobile_$web_MyApp());
	}
	,start: function() {
		this.render();
	}
	,__class__: mobile_$web_Main
};
String.prototype.__class__ = String;
String.__name__ = ["String"];
Array.__name__ = ["Array"];
var __map_reserved = {};
cordax_Cordax.views = new haxe_ds_StringMap();
js_Boot.__toStr = ({ }).toString;
mobile_$web_Main.main();
})(typeof window != "undefined" ? window : typeof global != "undefined" ? global : typeof self != "undefined" ? self : this);
