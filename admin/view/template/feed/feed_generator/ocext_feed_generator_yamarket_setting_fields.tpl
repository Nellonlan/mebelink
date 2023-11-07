
<select class="form-control"  name="setting[<?php echo $name_field ?>][field][status]" onchange="settingFieldsYamarket(this.value,'<?php echo $setting_id ?>' ,'<?php echo $name_field ?>');" >
    <option value="0"><?php echo $text_disable ?></option>
    <?php
        
        $template_setting_fields_css['option_id'] = "display:none";
        $template_setting_fields_css['attribute_id'] = "display:none";
        $template_setting_fields_css['category_id'] = "display:none";
        $template_setting_fields_css['composite'] = "display:none";
        $template_setting_fields_css['text_field'] = "display:none";
        $setting = $template_setting['setting'];

    ?>
    <?php foreach($content_parts as $template_setting_field){ ?>
        <?php if(isset($setting[$name_field]['field']['status']) && $setting[$name_field]['field']['status'] == $template_setting_field){ ?>
            <?php $template_setting_fields_css[$template_setting_field] = ""; ?>
            <option selected="" value="<?php echo $template_setting_field; ?>"><?php if(isset(${'text_setting_name_composite_element_'.$template_setting_field})){ echo ${'text_setting_name_composite_element_'.$template_setting_field}; }else{ echo $template_setting_field.' '.$text_setting_name_composite_element_self; } ?></option>
        <?php }else{ ?>
            <option value="<?php echo $template_setting_field; ?>"><?php if(isset(${'text_setting_name_composite_element_'.$template_setting_field})){ echo ${'text_setting_name_composite_element_'.$template_setting_field}; }else{ echo $template_setting_field.' '.$text_setting_name_composite_element_self; } ?></option>
        <?php } ?>
        
    <?php } ?>
</select>
    
<div class="setting_fields<?php echo $setting_id.$name_field ?>" id="setting_fields_category_id<?php echo $setting_id.$name_field ?>" style="border-left: 2px solid #cccccc; padding-left: 7px; background: cornsilk; margin-top: 10px; <?php echo $template_setting_fields_css['category_id'] ?>"><?php echo $text_setting_offer_composite_category_id; ?></div>

<div class="setting_fields<?php echo $setting_id.$name_field ?>" id="setting_fields_text_field<?php echo $setting_id.$name_field ?>" style="margin-top: 5px; <?php echo $template_setting_fields_css['text_field'] ?>" >
    
    <input type="text" name="setting[<?php echo $name_field ?>][field][text_field]" value="<?php if(isset($setting[$name_field]['field']['text_field']) && $setting[$name_field]['field']['text_field']) { echo $setting[$name_field]['field']['text_field']; } else { echo ''; } ?>"  class="form-control" />
    
</div>

<table class="table table-bordered table-hover" style="margin-top: 5px; margin-bottom: 0px;">
        <tbody>
        <tr class="setting_fields<?php echo $setting_id.$name_field ?>" id="setting_fields_option_id<?php echo $setting_id.$name_field ?>" style="<?php echo $template_setting_fields_css['option_id']; ?>">
            <td colspan="2">
                <?php if($options){ ?>
                <div class="scrollbox" style="height: 70px; overflow-y: auto">
                    <?php foreach($options as $option_id=>$option){ ?>

                        <div>
                            
                            
                            <?php if(isset($setting[$name_field]['field']['option_id']) && $setting[$name_field]['field']['option_id']==$option_id){ ?>
                                <input type="radio" checked="" name="setting[<?php echo $name_field ?>][field][option_id]" value="<?php echo $option_id ?>" />
                                <?php echo $option['name']; ?>
                            <?php }else{ ?>
                                <input type="radio" name="setting[<?php echo $name_field ?>][field][option_id]" value="<?php echo $option_id ?>" />
                                <?php echo $option['name']; ?>
                            <?php } ?>
                            
                        </div>

                    <?php } ?>
                </div>
                <?php }else{ ?>
                <div class="alert-info" align="center"><?php echo $text_setting_offer_composite_option_id_empty ?></div>
                <?php } ?>
            </td>
        </tr>
        <tr class="setting_fields<?php echo $setting_id.$name_field ?>" id="setting_fields_attribute_id<?php echo $setting_id.$name_field ?>" style="<?php echo $template_setting_fields_css['attribute_id']; ?>">
            <td colspan="2">
                <?php if($attributes){ ?>
                <div class="scrollbox" style="height: 150px; overflow-y: auto; width: 100%">
                    
                    <?php foreach($attributes as $attribute_group_id=>$attribute_group){ ?>

                        <?php if(isset($attribute_group_name)){ ?>
                            <?php unset($attribute_group_name); ?>
                        <?php } ?>

                        <?php foreach($attribute_group as $attribute_id=>$attribute){ ?>
                            <?php if(!isset($attribute_group_name)){ ?>
                                <?php $attribute_group_name = $attribute['attribute_group']; ?>
                                <h4 style="margin-top: 15px; margin-bottom: 10px;"><?php echo $attribute_group_name ?></h4>
                            <?php } ?>

                            <div>
                                
                                <?php if(isset($setting[$name_field]['field']['attribute_id']) && $setting[$name_field]['field']['attribute_id']==$attribute_group_id.'___'.$attribute_id){ ?>
                                    <input checked="" type="radio" name="setting[<?php echo $name_field ?>][field][attribute_id]" value="<?php echo $attribute_group_id.'___'.$attribute_id ?>" />
                                    <?php echo $attribute['name']; ?>
                                <?php }else{ ?>
                                    <input type="radio" name="setting[<?php echo $name_field ?>][field][attribute_id]" value="<?php echo $attribute_group_id.'___'.$attribute_id ?>" />
                                    <?php echo $attribute['name']; ?>
                                <?php } ?>
                            </div>

                        <?php } ?>

                    <?php } ?>
                </div>
                <?php }else{ ?>
                <div class="alert-info" align="center"><?php echo $text_setting_offer_composite_attribute_id_empty ?></div>
                <?php } ?>
            </td>
        </tr>
        </tbody>
    </table>