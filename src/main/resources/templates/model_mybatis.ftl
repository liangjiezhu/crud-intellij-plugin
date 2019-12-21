package ${package};

import lombok.Data;
import io.swagger.annotations.*;
<#list imports as import>
    import ${import};
</#list>

/**
* ${comment}
*/
@Data
@ApiModel(value = "${comment}", description = "${comment}")
public class ${simpleName} {
<#list fields as field>
    /**
    * ${field.comment}
    */
    @ApiModelProperty(value = "${field.comment}", position= ${field_index})
    private ${field.typeSimpleName} ${field.name};
</#list>
}