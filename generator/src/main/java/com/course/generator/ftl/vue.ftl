<template>
    <div>
        <p>
            <button v-on:click="add()" class="btn btn-white btn-default btn-round">
                <i class="ace-icon fa fa-plus orange"></i>
                添加
            </button>
            &nbsp;
            <button v-on:click="list(1)" class="btn btn-white btn-default btn-round">
                <i class="ace-icon fa fa-refresh green"></i>
                刷新
            </button>
        </p>
        <Pagination ref="pagination" v-bind:list="list" v-bind:itemCount="6"></Pagination>
        <table id="simple-table" class="table  table-bordered table-hover">
            <thead>
            <tr>
                <th class="center">
                    <label class="pos-rel">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                    </label>
                </th>
                <#list fieldList as field>
                    <th>${field.nameCn}</th>
                </#list>
<#--                <th>ID</th>-->
<#--                <th>名称</th>-->
<#--                <th>课程ID</th>-->
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="${domain} in ${domain}s">
                <td class="center">
                    <label class="pos-rel">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                    </label>
                </td>
                <#list fieldList as field>
                    <td>{{${domain}.${field.nameHump}}}</td>
                </#list>
<#--                <td>{{${domain}.id}}</td>-->
<#--                <td>{{${domain}.name}}</td>-->
<#--                <td>{{${domain}.courseId}}</td>-->
                <td>
                    <div class="hidden-sm hidden-xs btn-group">

                        <button v-on:click="edit(${domain})" class="btn btn-xs btn-info">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>

                        <button v-on:click="del(${domain}.id)" class="btn btn-xs btn-danger">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                    </div>

                    <div class="hidden-md hidden-lg">
                        <div class="inline pos-rel">
                            <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                            </button>

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">

                                <li>
                                    <a v-on:click="edit(${domain})" href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																			<span class="green">
																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
                                    </a>
                                </li>

                                <li>
                                    <a v-on:click="del(${domain}.id)" href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
																			<span class="red">
																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>

            </tbody>
        </table>


        <div id="form-modal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">表单</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <#list fieldList as field>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">${field.nameCn}</label>
                                    <div class="col-sm-10">
                                        <input v-model="${domain}.${field.nameHump}" class="form-control" >
                                    </div>
                                </div>
                            </#list>
<#--                            <div class="form-group">-->
<#--                                <label class="col-sm-2 control-label">名称</label>-->
<#--                                <div class="col-sm-10">-->
<#--                                    <input v-model="${domain}.name" class="form-control" placeholder="名称">-->
<#--                                </div>-->
<#--                            </div>-->
<#--                            <div class="form-group">-->
<#--                                <label class="col-sm-2 control-label">课程ID</label>-->
<#--                                <div class="col-sm-10">-->
<#--                                    <input v-model="${domain}.courseId" class="form-control" placeholder="课程ID">-->
<#--                                </div>-->
<#--                            </div>-->
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button v-on:click="save()" type="button" class="btn btn-primary">保存</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

    </div>
</template>

<script>
    import Pagination from "../../components/Pagination";

    export default {
        components: { Pagination },
        name: '${Domain}',
        data: function () {
            return {
                ${domain}: {},
                ${domain}s: []
            }
        },
        mounted: function () {
            let _this = this;
            _this.$refs.pagination.pageSize = 5;
            _this.list(1);
            // sidebar激活样式方法一
            // this.$parent.activeSidebar("${module}-${domain}-sidebar");
        },
        methods: {
            /**
             * 点击【新增】
             */
            add() {
                let _this = this;
                _this.$data.${domain} = _this.$options.data().${domain};
                // _this.${domain} = {};
                $("#form-modal").modal("show");
            },

            /**
             * 列表查询
             */
            list(pageNum) {
                Loading.show(); //加载动画效果
                let _this = this;
                _this.$ajax.post(process.env.VUE_APP_SERVER + '/${module}/admin/${domain}/list', {
                    pageNum: pageNum,
                    pageSize: _this.$refs.pagination.pageSize,
                }).then((response) => {
                    Loading.hide(); // 加载动画效果关闭
                    // console.log("查询${tableNameCn}列表结果：", response);
                    let responseData = response.data;
                    _this.${domain}s = responseData.content.list;
                    _this.$refs.pagination.render(pageNum, responseData.content.total);
                })
            },

            /**
             * 点击【保存】
             */
            save(pageNum) {
                let _this = this;

                // 保存校验
                //1 != 1是为了自动生成的代码if()中开头不会有||
                if (1 != 1
                    <#list fieldList as field>
                    <#if !field.nullAble>
                    || !Validator.require(_this.${domain}.${field.nameHump}, "${field.nameCn}")
                    </#if>
                    <#if (field.length > 0)>
                    || !Validator.length(_this.${domain}.${field.nameHump}, "${field.nameCn}", 1, ${field.length})
                    </#if>
                    </#list>
                ) {
                    return;
                }

                Loading.show();
                _this.$ajax.post(process.env.VUE_APP_SERVER + '/${module}/admin/${domain}/save',
                    _this.${domain}).then((response) => {
                    Loading.hide();
                    // console.log("保存${tableNameCn}列表结果：", response);
                    let responseData = response.data;
                    if (responseData.success) {
                        // _this.$data.${domain} = _this.$options.data().${domain};
                        $("#form-modal").modal("hide");
                        _this.list(_this.$refs.pagination.pageNum);
                        Toast.success("保存成功！");
                    } else {
                        Toast.warning(responseData.message);
                    }
                })
            },

            /**
             * 点击【编辑】
             */
            edit(${domain}) {
                let _this = this;
                _this.${domain} = $.extend({}, ${domain});
                $("#form-modal").modal("show");
            },

            /**
             * 点击【删除】
             */
            del(id) {
                // console.log(id);
                let _this = this;

                Confirm.show("删除${tableNameCn}后不可恢复", function () {
                    Loading.show();
                    _this.$ajax.delete(process.env.VUE_APP_SERVER + '/${module}/admin/${domain}/delete/' + id
                    ).then((response) => {
                        Loading.hide();
                        // console.log("删除${tableNameCn}列表结果：", response);
                        let responseData = response.data;
                        if (responseData.success) {
                            // $("#del-modal").modal("hide");
                            _this.list(_this.$refs.pagination.pageNum);
                            Toast.success("删除成功！");
                        }
                    })
                });

            },

        }
    }
</script>