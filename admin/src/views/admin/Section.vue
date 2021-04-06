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
                <th>ID</th>
                <th>名称</th>
                <th>课程ID</th>
                <th>大章</th>
                <th>视频</th>
                <th>时长</th>
                <th>收费</th>
                <th>顺序</th>
                <th>创建时间</th>
                <th>修改时间</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="section in sections">
                <td class="center">
                    <label class="pos-rel">
                        <input type="checkbox" class="ace"/>
                        <span class="lbl"></span>
                    </label>
                </td>
                <td>{{section.id}}</td>
                <td>{{section.title}}</td>
                <td>{{section.courseId}}</td>
                <td>{{section.chapterId}}</td>
                <td>{{section.video}}</td>
                <td>{{section.time}}</td>
                <td>{{section.charge}}</td>
                <td>{{section.sort}}</td>
                <td>{{section.createdAt}}</td>
                <td>{{section.updatedAt}}</td>
                <td>
                    <div class="hidden-sm hidden-xs btn-group">

                        <button v-on:click="edit(section)" class="btn btn-xs btn-info">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </button>

                        <button v-on:click="del(section.id)" class="btn btn-xs btn-danger">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </button>

                    </div>

                    <div class="hidden-md hidden-lg">
                        <div class="inline pos-rel">
                            <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown"
                                    data-position="auto">
                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                            </button>

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">

                                <li>
                                    <a v-on:click="edit(section)" href="#" class="tooltip-success" data-rel="tooltip"
                                       title="Edit">
																			<span class="green">
																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
                                    </a>
                                </li>

                                <li>
                                    <a v-on:click="del(section.id)" href="#" class="tooltip-error" data-rel="tooltip"
                                       title="Delete">
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
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">表单</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">ID</label>
                                <div class="col-sm-10">
                                    <input v-model="section.id" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-10">
                                    <input v-model="section.title" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">课程ID</label>
                                <div class="col-sm-10">
                                    <input v-model="section.courseId" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">大章</label>
                                <div class="col-sm-10">
                                    <input v-model="section.chapterId" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">视频</label>
                                <div class="col-sm-10">
                                    <input v-model="section.video" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">时长</label>
                                <div class="col-sm-10">
                                    <input v-model="section.time" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">收费</label>
                                <div class="col-sm-10">
                                    <input v-model="section.charge" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">顺序</label>
                                <div class="col-sm-10">
                                    <input v-model="section.sort" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">创建时间</label>
                                <div class="col-sm-10">
                                    <input v-model="section.createdAt" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">修改时间</label>
                                <div class="col-sm-10">
                                    <input v-model="section.updatedAt" class="form-control">
                                </div>
                            </div>
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
        name: 'Section',
        data: function () {
            return {
                section: {},
                sections: []
            }
        },
        mounted: function () {
            let _this = this;
            _this.$refs.pagination.pageSize = 5;
            _this.list(1);
            // sidebar激活样式方法一
            // this.$parent.activeSidebar("business-section-sidebar");
        },
        methods: {
            /**
             * 点击【新增】
             */
            add() {
                let _this = this;
                _this.$data.section = _this.$options.data().section;
                // _this.section = {};
                $("#form-modal").modal("show");
            },

            /**
             * 列表查询
             */
            list(pageNum) {
                Loading.show(); //加载动画效果
                let _this = this;
                _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/section/list', {
                    pageNum: pageNum,
                    pageSize: _this.$refs.pagination.pageSize,
                }).then((response) => {
                    Loading.hide(); // 加载动画效果关闭
                    // console.log("查询小节列表结果：", response);
                    let responseData = response.data;
                    _this.sections = responseData.content.list;
                    _this.$refs.pagination.render(pageNum, responseData.content.total);
                })
            },

            /**
             * 点击【保存】
             */
            save(pageNum) {
                let _this = this;

                Loading.show();
                _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/admin/section/save',
                    _this.section).then((response) => {
                    Loading.hide();
                    // console.log("保存小节列表结果：", response);
                    let responseData = response.data;
                    if (responseData.success) {
                        // _this.$data.section = _this.$options.data().section;
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
            edit(section) {
                let _this = this;
                _this.section = $.extend({}, section);
                $("#form-modal").modal("show");
            },

            /**
             * 点击【删除】
             */
            del(id) {
                // console.log(id);
                let _this = this;

                Confirm.show("删除小节后不可恢复", function () {
                    Loading.show();
                    _this.$ajax.delete(process.env.VUE_APP_SERVER + '/business/admin/section/delete/' + id
                    ).then((response) => {
                        Loading.hide();
                        // console.log("删除小节列表结果：", response);
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