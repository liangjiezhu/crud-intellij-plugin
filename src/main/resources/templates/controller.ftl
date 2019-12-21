package ${package};

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
<#if ormType==0>
import com.github.pagehelper.PageInfo;
<#else>
import org.springframework.data.domain.Page;
</#if>
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
<#list imports as import>
    import ${import};
</#list>
import java.util.List;

<#assign model=service.dao.model />
<#list model.fields as field>
    <#if field.id>
/**
 * ${comment}
 */
@RestController
@RequestMapping("/${model.varName+'s'}")
@Api(tags = "${model.comment}")
public class ${simpleName} {
    @Autowired
    private ${service.simpleName} ${service.varName};

    @GetMapping("/{id}")
    @ApiOperation("通过ID查询单个${model.comment}")
    public ${model.simpleName} findById(@ApiParam("ID") @PathVariable("id") ${field.typeSimpleName} id) {
        return ${service.varName}.findById(id);
    }

    @PostMapping("/findByObj")
    @ApiOperation("通过属性查询单个${model.comment}")
    public ${model.simpleName} findByObj(@RequestBody ${model.simpleName} ${model.varName}) {
        return ${service.varName}.findByObj(${model.varName});
    }

    @GetMapping
    @ApiOperation("直接分页查询${model.comment}")
    public Page<#if ormType==0>Info</#if><${model.simpleName}> findByPage(@ApiParam("页号") @RequestParam(defaultValue = "1") Integer pageNum,
                                                @ApiParam("每页大小") @RequestParam(defaultValue = "10") Integer pageSize) {
        return ${service.varName}.findByPage(pageNum, pageSize);
    }

    @PostMapping("/queryPage")
    @ApiOperation("通过属性分页查询${model.comment}")
    public Page<#if ormType==0>Info</#if><${model.simpleName}> findByPage(@ApiParam("页号") @RequestParam(defaultValue = "1") Integer pageNum,
                                                @ApiParam("每页大小") @RequestParam(defaultValue = "10") Integer pageSize,
                                                @RequestBody ${model.simpleName} ${model.varName}) {
        return ${service.varName}.queryPage(pageNum, pageSize,${model.varName});
    }

    @PostMapping("/query")
    @ApiOperation("通过属性列表查询${model.comment}")
    public List<${model.simpleName}> query(@RequestBody ${model.simpleName} ${model.varName}) {
        return ${service.varName}.query(${model.varName});
    }

    @PostMapping("/add")
    @ApiOperation("新增${model.comment}")
    public void insert(@RequestBody ${model.simpleName} ${model.varName}) {
        ${service.varName}.insert(${model.varName});
    }

    @PutMapping
    @ApiOperation("修改${model.comment}")
    public void update(@RequestBody ${model.simpleName} ${model.varName}) {
        ${service.varName}.update(${model.varName});
    }

    @DeleteMapping("/{id}")
    @ApiOperation("通过ID删除单个${model.comment}")
    public void deleteById(@ApiParam("ID") @PathVariable("id") ${field.typeSimpleName} id) {
        ${service.varName}.deleteById(id);
    }
}
    </#if>
</#list>