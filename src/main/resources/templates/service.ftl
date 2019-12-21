package ${package};

<#if ormType==0>
import com.github.pagehelper.PageInfo;
<#else>
import org.springframework.data.domain.Page;
</#if>
<#list imports as import>
    import ${import};
</#list>
import java.util.List;

/**
 * ${comment}
 */
public interface ${simpleName} {

<#assign model=dao.model />
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
     * 通过属性查询单个${model.comment}
     *
     * @param ${model.varName}
     * @return {@link ${model.simpleName}}
     */
     ${model.simpleName} findByObj(${model.simpleName} ${model.varName});

    /**
     * 分页查询${model.comment}
     *
     * @param pageNum   页号
     * @param pageSize 每页大小
     * @return {@link ${model.simpleName}}
     */
     Page<#if ormType==0>Info</#if><${model.simpleName}> findByPage(int pageNum, int pageSize);

    /**
     * 分页查询${model.comment}
     *
     * @param pageNum   页号
     * @param pageSize 每页大小
     * @param ${model.varName}
     * @return {@link ${model.simpleName}}
     */
     Page<#if ormType==0>Info</#if><${model.simpleName}> queryPage(int pageNum, int pageSize,${model.simpleName} ${model.varName});

    /**
     * 查询${model.comment}
     *
     * @param ${model.varName}
     * @return {@link ${model.simpleName}}
     */
     List<${model.simpleName}> query(${model.simpleName} ${model.varName});

    /**
     * 新增${model.comment}
     *
     * @param ${model.varName} ${model.comment}
     */
    void insert(${model.simpleName} ${model.varName});

    /**
     * 修改${model.comment}
     *
     * @param ${model.varName} ${model.comment}
     */
    void update(${model.simpleName} ${model.varName});

    /**
     * 通过ID删除单个${model.comment}
     *
     * @param id ID
     */
    void deleteById(${field.typeSimpleName} id);
    </#if>
</#list>

}