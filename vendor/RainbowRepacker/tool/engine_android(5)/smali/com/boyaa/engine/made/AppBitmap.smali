.class public Lcom/boyaa/engine/made/AppBitmap;
.super Ljava/lang/Object;
.source "AppBitmap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;
    }
.end annotation


# static fields
.field private static final ALIGN_BOTTOM:I = 0x23

.field private static final ALIGN_BOTTOMLEFT:I = 0x21

.field private static final ALIGN_BOTTOMRIGHT:I = 0x22

.field private static final ALIGN_CENTER:I = 0x33

.field private static final ALIGN_LEFT:I = 0x31

.field private static final ALIGN_RIGHT:I = 0x32

.field private static final ALIGN_TOP:I = 0x13

.field private static final ALIGN_TOPLEFT:I = 0x11

.field private static final ALIGN_TOPRIGHT:I = 0x12

.field private static mInstance:Lcom/boyaa/engine/made/AppBitmap;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mFontNameTypefaceMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field

.field private mPaint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppBitmap;->mPaint:Landroid/graphics/Paint;

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppBitmap;->mFontNameTypefaceMap:Ljava/util/HashMap;

    .line 58
    iput-object p1, p0, Lcom/boyaa/engine/made/AppBitmap;->mContext:Landroid/content/Context;

    .line 59
    return-void
.end method

.method private castAlignment(I)Landroid/text/Layout$Alignment;
    .locals 1
    .param p1, "alignment"    # I

    .prologue
    .line 223
    sparse-switch p1, :sswitch_data_0

    .line 237
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    :goto_0
    return-object v0

    .line 227
    :sswitch_0
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    goto :goto_0

    .line 231
    :sswitch_1
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    goto :goto_0

    .line 235
    :sswitch_2
    sget-object v0, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    goto :goto_0

    .line 223
    nop

    :sswitch_data_0
    .sparse-switch
        0x11 -> :sswitch_0
        0x12 -> :sswitch_1
        0x13 -> :sswitch_2
        0x21 -> :sswitch_0
        0x22 -> :sswitch_1
        0x23 -> :sswitch_2
        0x31 -> :sswitch_0
        0x32 -> :sswitch_1
        0x33 -> :sswitch_2
    .end sparse-switch
.end method

.method private convertByteArrayToString([B)Ljava/lang/String;
    .locals 1
    .param p1, "byteArray"    # [B

    .prologue
    .line 242
    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    .line 243
    :cond_0
    const-string v0, ""

    .line 246
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    goto :goto_0
.end method

.method public static createBitmap([B[BIIIII)V
    .locals 9
    .param p0, "content"    # [B
    .param p1, "fontName"    # [B
    .param p2, "fontSize"    # I
    .param p3, "alignment"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "iMultiLine"    # I

    .prologue
    .line 45
    invoke-static {}, Lcom/boyaa/engine/made/AppBitmap;->getInstance()Lcom/boyaa/engine/made/AppBitmap;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-virtual/range {v0 .. v7}, Lcom/boyaa/engine/made/AppBitmap;->createTextBitmap([B[BIIIII)Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;

    move-result-object v8

    .line 46
    .local v8, "info":Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;
    iget-object v0, v8, Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;->Pixels:[B

    iget v1, v8, Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;->width:I

    iget v2, v8, Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;->height:I

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/AppBitmap;->initReturnBitmap([BII)V

    .line 47
    return-void
.end method

.method private drawMultiLineText(Landroid/graphics/Paint;Ljava/lang/String;III)Landroid/graphics/Bitmap;
    .locals 13
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "alignment"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .prologue
    .line 131
    move/from16 v0, p3

    invoke-direct {p0, v0}, Lcom/boyaa/engine/made/AppBitmap;->castAlignment(I)Landroid/text/Layout$Alignment;

    move-result-object v6

    .line 133
    .local v6, "align":Landroid/text/Layout$Alignment;
    const/16 v3, 0x8

    move/from16 v0, p4

    if-ge v0, v3, :cond_0

    const/16 p4, 0x8

    .line 134
    :cond_0
    new-instance v4, Landroid/text/TextPaint;

    invoke-direct {v4}, Landroid/text/TextPaint;-><init>()V

    .line 135
    .local v4, "textPaint":Landroid/text/TextPaint;
    invoke-virtual {v4, p1}, Landroid/text/TextPaint;->set(Landroid/graphics/Paint;)V

    .line 136
    new-instance v2, Landroid/text/StaticLayout;

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, p2

    move/from16 v5, p4

    invoke-direct/range {v2 .. v9}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 138
    .local v2, "layout":Landroid/text/StaticLayout;
    const/4 v12, 0x0

    .line 139
    .local v12, "y":I
    invoke-virtual {v2}, Landroid/text/StaticLayout;->getHeight()I

    move-result v3

    move/from16 v0, p5

    if-ge v3, v0, :cond_1

    .line 140
    invoke-virtual {v2}, Landroid/text/StaticLayout;->getHeight()I

    move-result v3

    move/from16 v0, p3

    move/from16 v1, p5

    invoke-direct {p0, v0, v1, v3}, Lcom/boyaa/engine/made/AppBitmap;->getDiffY(III)I

    move-result v12

    .line 147
    :goto_0
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p4

    move/from16 v1, p5

    invoke-static {v0, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 148
    .local v10, "bitmap":Landroid/graphics/Bitmap;
    new-instance v11, Landroid/graphics/Canvas;

    invoke-direct {v11, v10}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 149
    .local v11, "canvas":Landroid/graphics/Canvas;
    const/4 v3, 0x0

    int-to-float v5, v12

    invoke-virtual {v11, v3, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 150
    invoke-virtual {v2, v11}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 152
    return-object v10

    .line 143
    .end local v10    # "bitmap":Landroid/graphics/Bitmap;
    .end local v11    # "canvas":Landroid/graphics/Canvas;
    :cond_1
    const/4 v12, 0x0

    .line 144
    invoke-virtual {v2}, Landroid/text/StaticLayout;->getHeight()I

    move-result p5

    goto :goto_0
.end method

.method private drawSingleLineText(Landroid/graphics/Paint;Ljava/lang/String;III)Landroid/graphics/Bitmap;
    .locals 13
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "alignment"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .prologue
    .line 102
    const-string v11, "(\r\n|\n\r|\r|\n)"

    const-string v12, ""

    invoke-virtual {p2, v11, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 103
    const/4 v11, 0x0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {p1, p2, v11, v12}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v11

    float-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v11

    double-to-int v6, v11

    .line 104
    .local v6, "maxWidth":I
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v4

    .line 105
    .local v4, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget v11, v4, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v12, v4, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v11, v12

    int-to-double v11, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v11

    double-to-int v5, v11

    .line 107
    .local v5, "maxHeight":I
    move/from16 v0, p4

    if-ge v0, v6, :cond_0

    move/from16 p4, v6

    .line 108
    :cond_0
    move/from16 v0, p5

    if-ge v0, v5, :cond_1

    move/from16 p5, v5

    .line 109
    :cond_1
    const/16 v11, 0x400

    move/from16 v0, p4

    if-le v0, v11, :cond_2

    const/16 p4, 0x400

    .line 111
    :cond_2
    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p4

    move/from16 v1, p5

    invoke-static {v0, v1, v11}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 112
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 114
    .local v3, "canvas":Landroid/graphics/Canvas;
    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 115
    .local v7, "rect":Landroid/graphics/Rect;
    const/4 v11, 0x0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {p1, p2, v11, v12, v7}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 116
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v11

    float-to-int v8, v11

    .line 118
    .local v8, "textWidth":I
    move/from16 v0, p3

    move/from16 v1, p4

    invoke-direct {p0, v0, v1, v8}, Lcom/boyaa/engine/made/AppBitmap;->getDiffX(III)I

    move-result v11

    int-to-float v9, v11

    .line 119
    .local v9, "x":F
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v11

    move/from16 v0, p3

    move/from16 v1, p5

    invoke-direct {p0, v0, v1, v11}, Lcom/boyaa/engine/made/AppBitmap;->getDiffY(III)I

    move-result v11

    int-to-float v10, v11

    .line 121
    .local v10, "y":F
    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    .line 122
    const/4 v11, 0x0

    iget v12, v7, Landroid/graphics/Rect;->top:I

    neg-int v12, v12

    int-to-float v12, v12

    invoke-virtual {v3, v11, v12}, Landroid/graphics/Canvas;->translate(FF)V

    .line 123
    invoke-virtual {v3, p2, v9, v10, p1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 126
    invoke-virtual {v3}, Landroid/graphics/Canvas;->restore()V

    .line 127
    return-object v2
.end method

.method private getDiffX(III)I
    .locals 1
    .param p1, "alignment"    # I
    .param p2, "bitmapWidth"    # I
    .param p3, "textWidth"    # I

    .prologue
    const/4 v0, 0x0

    .line 185
    sparse-switch p1, :sswitch_data_0

    .line 199
    :goto_0
    :sswitch_0
    return v0

    .line 189
    :sswitch_1
    sub-int v0, p2, p3

    div-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 197
    :sswitch_2
    sub-int v0, p2, p3

    goto :goto_0

    .line 185
    nop

    :sswitch_data_0
    .sparse-switch
        0x11 -> :sswitch_0
        0x12 -> :sswitch_2
        0x13 -> :sswitch_1
        0x21 -> :sswitch_0
        0x22 -> :sswitch_2
        0x23 -> :sswitch_1
        0x31 -> :sswitch_0
        0x32 -> :sswitch_2
        0x33 -> :sswitch_1
    .end sparse-switch
.end method

.method private getDiffY(III)I
    .locals 1
    .param p1, "alignment"    # I
    .param p2, "bitmapHeight"    # I
    .param p3, "textHeight"    # I

    .prologue
    const/4 v0, 0x0

    .line 204
    sparse-switch p1, :sswitch_data_0

    .line 218
    :goto_0
    :sswitch_0
    return v0

    .line 212
    :sswitch_1
    sub-int v0, p2, p3

    goto :goto_0

    .line 216
    :sswitch_2
    sub-int v0, p2, p3

    div-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 204
    nop

    :sswitch_data_0
    .sparse-switch
        0x11 -> :sswitch_0
        0x12 -> :sswitch_0
        0x13 -> :sswitch_0
        0x21 -> :sswitch_1
        0x22 -> :sswitch_1
        0x23 -> :sswitch_1
        0x31 -> :sswitch_2
        0x32 -> :sswitch_2
        0x33 -> :sswitch_2
    .end sparse-switch
.end method

.method private static getInstance()Lcom/boyaa/engine/made/AppBitmap;
    .locals 2

    .prologue
    .line 50
    sget-object v0, Lcom/boyaa/engine/made/AppBitmap;->mInstance:Lcom/boyaa/engine/made/AppBitmap;

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Lcom/boyaa/engine/made/AppBitmap;

    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/boyaa/engine/made/AppActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/boyaa/engine/made/AppBitmap;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/boyaa/engine/made/AppBitmap;->mInstance:Lcom/boyaa/engine/made/AppBitmap;

    .line 54
    :cond_0
    sget-object v0, Lcom/boyaa/engine/made/AppBitmap;->mInstance:Lcom/boyaa/engine/made/AppBitmap;

    return-object v0
.end method

.method private getPixels(Landroid/graphics/Bitmap;)[B
    .locals 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 173
    if-nez p1, :cond_0

    .line 174
    const/4 v1, 0x0

    .line 181
    :goto_0
    return-object v1

    .line 177
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x4

    new-array v1, v2, [B

    .line 178
    .local v1, "pixels":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 179
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 180
    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    goto :goto_0
.end method

.method private getTypeFace(Ljava/lang/String;)Landroid/graphics/Typeface;
    .locals 6
    .param p1, "fontName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 156
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    const-string v3, ".ttf"

    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 169
    :cond_0
    :goto_0
    return-object v2

    .line 160
    :cond_1
    iget-object v3, p0, Lcom/boyaa/engine/made/AppBitmap;->mFontNameTypefaceMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 162
    :try_start_0
    iget-object v3, p0, Lcom/boyaa/engine/made/AppBitmap;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "fonts/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    .line 163
    .local v1, "typeface":Landroid/graphics/Typeface;
    iget-object v3, p0, Lcom/boyaa/engine/made/AppBitmap;->mFontNameTypefaceMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    .end local v1    # "typeface":Landroid/graphics/Typeface;
    :cond_2
    iget-object v2, p0, Lcom/boyaa/engine/made/AppBitmap;->mFontNameTypefaceMap:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Typeface;

    goto :goto_0

    .line 164
    :catch_0
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method

.method private initPaint(Ljava/lang/String;I)Landroid/graphics/Paint;
    .locals 2
    .param p1, "fontName"    # Ljava/lang/String;
    .param p2, "fontSize"    # I

    .prologue
    .line 91
    iget-object v0, p0, Lcom/boyaa/engine/made/AppBitmap;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 92
    iget-object v0, p0, Lcom/boyaa/engine/made/AppBitmap;->mPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 93
    iget-object v0, p0, Lcom/boyaa/engine/made/AppBitmap;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 94
    iget-object v0, p0, Lcom/boyaa/engine/made/AppBitmap;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 95
    iget-object v0, p0, Lcom/boyaa/engine/made/AppBitmap;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppBitmap;->getTypeFace(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 96
    iget-object v0, p0, Lcom/boyaa/engine/made/AppBitmap;->mPaint:Landroid/graphics/Paint;

    int-to-float v1, p2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 98
    iget-object v0, p0, Lcom/boyaa/engine/made/AppBitmap;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public static native initReturnBitmap([BII)V
.end method


# virtual methods
.method public createTextBitmap([B[BIIIII)Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;
    .locals 9
    .param p1, "contentByteArray"    # [B
    .param p2, "fontNameByteArray"    # [B
    .param p3, "fontSize"    # I
    .param p4, "alignment"    # I
    .param p5, "width"    # I
    .param p6, "height"    # I
    .param p7, "iMultiLine"    # I

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppBitmap;->convertByteArrayToString([B)Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, "content":Ljava/lang/String;
    invoke-direct {p0, p2}, Lcom/boyaa/engine/made/AppBitmap;->convertByteArrayToString([B)Ljava/lang/String;

    move-result-object v7

    .line 70
    .local v7, "fontName":Ljava/lang/String;
    if-gez p5, :cond_0

    const/4 p5, 0x0

    .line 71
    :cond_0
    if-gez p6, :cond_1

    const/4 p6, 0x0

    .line 72
    :cond_1
    if-gtz p3, :cond_2

    const/4 p3, 0x1

    .line 74
    :cond_2
    invoke-direct {p0, v7, p3}, Lcom/boyaa/engine/made/AppBitmap;->initPaint(Ljava/lang/String;I)Landroid/graphics/Paint;

    move-result-object v1

    .line 76
    .local v1, "paint":Landroid/graphics/Paint;
    if-nez p7, :cond_3

    move-object v0, p0

    move v3, p4

    move v4, p5

    move v5, p6

    .line 77
    invoke-direct/range {v0 .. v5}, Lcom/boyaa/engine/made/AppBitmap;->drawSingleLineText(Landroid/graphics/Paint;Ljava/lang/String;III)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 82
    .local v6, "bitmap":Landroid/graphics/Bitmap;
    :goto_0
    new-instance v8, Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;

    invoke-direct {v8, p0}, Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;-><init>(Lcom/boyaa/engine/made/AppBitmap;)V

    .line 83
    .local v8, "ret":Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;
    invoke-direct {p0, v6}, Lcom/boyaa/engine/made/AppBitmap;->getPixels(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    iput-object v0, v8, Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;->Pixels:[B

    .line 84
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, v8, Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;->width:I

    .line 85
    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, v8, Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;->height:I

    .line 87
    return-object v8

    .end local v6    # "bitmap":Landroid/graphics/Bitmap;
    .end local v8    # "ret":Lcom/boyaa/engine/made/AppBitmap$ReturnInfo;
    :cond_3
    move-object v0, p0

    move v3, p4

    move v4, p5

    move v5, p6

    .line 79
    invoke-direct/range {v0 .. v5}, Lcom/boyaa/engine/made/AppBitmap;->drawMultiLineText(Landroid/graphics/Paint;Ljava/lang/String;III)Landroid/graphics/Bitmap;

    move-result-object v6

    .restart local v6    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_0
.end method
