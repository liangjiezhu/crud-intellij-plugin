package ${package};

import com.github.pagehelper.Page;
<#list imports as import>
    import ${import};
</#list>
import java.util.List;

/**
 * ${comment}
 */
public interface ${simpleName} {

<#list model.fields as field>
    <#if field.id>
    /**
     * 通过ID查询单个${model.comment}
     *
     * @param id ID
     * @return {@link ${model.simpleName}}
     */
     ${model.simpleName} findById(${field.typeSimpleName} id);

    /**
     * 通过${model.comment}任意属性查询单个${model.comment}
     *
     * @return {@link ${model.simpleName}}
     */
     ${model.simpleName} findByObj(${model.simpleName} ${model.varName});

    /**
     * 分页查询${model.comment}
     *
     * @return {@link ${model.simpleName}}
     */
     Page<${model.simpleName}> findByPage();

    /**
     * 通过${model.comment}任意属性查询${model.comment}列表
     *
     * @return {@link ${model.simpleName}}
     */
     List<${model.simpleName}> query(${model.simpleName} ${model.varName});

    /**
     * 通过${model.comment}任意属性分页查询${model.comment}列表
     *
     * @return {@link ${model.simpleName}}
     */
     Page<${model.simpleName}> queryPage(${model.simpleName} ${model.varName});

    /**
     * 新增${model.comment}
     *
     * @param ${model.varName} ${model.comment}
     */
    void insert(${model.simpleName} ${model.varName});

    /**
     * 动态新增${model.comment}
     *
     * @param ${model.varName} ${model.comment}
     */
    void insertSelective(${model.simpleName} ${model.varName});

    /**
     * 修改${model.comment}
     *
     * @param ${model.varName} ${model.comment}
     */
    void update(${model.simpleName} ${model.varName});

    /**
     * 动态修改${model.comment}
     *
     * @param ${model.varName} ${model.comment}
     */
    void updateSelective(${model.simpleName} ${model.varName});

    /**
     * 通过ID删除单个${model.comment}
     *
     * @param id ID
     */
    void deleteById(${field.typeSimpleName} id);
    </#if>
</#list>

}