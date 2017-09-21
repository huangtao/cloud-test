.class final Lcom/google/protobuf/BooleanArrayList;
.super Lcom/google/protobuf/AbstractProtobufList;
.source "BooleanArrayList.java"

# interfaces
.implements Lcom/google/protobuf/Internal$BooleanList;
.implements Ljava/util/RandomAccess;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/AbstractProtobufList",
        "<",
        "Ljava/lang/Boolean;",
        ">;",
        "Lcom/google/protobuf/Internal$BooleanList;",
        "Ljava/util/RandomAccess;"
    }
.end annotation


# static fields
.field private static final DEFAULT_CAPACITY:I = 0xa

.field private static final EMPTY_LIST:Lcom/google/protobuf/BooleanArrayList;


# instance fields
.field private array:[Z

.field private size:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    new-instance v0, Lcom/google/protobuf/BooleanArrayList;

    invoke-direct {v0}, Lcom/google/protobuf/BooleanArrayList;-><init>()V

    sput-object v0, Lcom/google/protobuf/BooleanArrayList;->EMPTY_LIST:Lcom/google/protobuf/BooleanArrayList;

    .line 52
    sget-object v0, Lcom/google/protobuf/BooleanArrayList;->EMPTY_LIST:Lcom/google/protobuf/BooleanArrayList;

    invoke-virtual {v0}, Lcom/google/protobuf/BooleanArrayList;->makeImmutable()V

    .line 53
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 74
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/google/protobuf/BooleanArrayList;-><init>(I)V

    .line 75
    return-void
.end method

.method constructor <init>(I)V
    .locals 1
    .param p1, "capacity"    # I

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/google/protobuf/AbstractProtobufList;-><init>()V

    .line 81
    new-array v0, p1, [Z

    iput-object v0, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    .line 82
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    .line 83
    return-void
.end method

.method constructor <init>(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p1, "other":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    invoke-direct {p0}, Lcom/google/protobuf/AbstractProtobufList;-><init>()V

    .line 90
    instance-of v2, p1, Lcom/google/protobuf/BooleanArrayList;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 91
    check-cast v1, Lcom/google/protobuf/BooleanArrayList;

    .line 92
    .local v1, "list":Lcom/google/protobuf/BooleanArrayList;
    iget-object v2, v1, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    invoke-virtual {v2}, [Z->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Z

    iput-object v2, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    .line 93
    iget v2, v1, Lcom/google/protobuf/BooleanArrayList;->size:I

    iput v2, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    .line 101
    .end local v1    # "list":Lcom/google/protobuf/BooleanArrayList;
    :cond_0
    return-void

    .line 95
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    iput v2, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    .line 96
    iget v2, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    .line 97
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    if-ge v0, v2, :cond_0

    .line 98
    iget-object v3, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    aput-boolean v2, v3, v0

    .line 97
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private addBoolean(IZ)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "element"    # Z

    .prologue
    const/4 v4, 0x0

    .line 150
    invoke-virtual {p0}, Lcom/google/protobuf/BooleanArrayList;->ensureIsMutable()V

    .line 151
    if-ltz p1, :cond_0

    iget v2, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    if-le p1, v2, :cond_1

    .line 152
    :cond_0
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p0, p1}, Lcom/google/protobuf/BooleanArrayList;->makeOutOfBoundsExceptionMessage(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 155
    :cond_1
    iget v2, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    iget-object v3, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    array-length v3, v3

    if-ge v2, v3, :cond_2

    .line 157
    iget-object v2, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    iget-object v3, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    add-int/lit8 v4, p1, 0x1

    iget v5, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    sub-int/2addr v5, p1

    invoke-static {v2, p1, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 171
    :goto_0
    iget-object v2, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    aput-boolean p2, v2, p1

    .line 172
    iget v2, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    .line 173
    iget v2, p0, Lcom/google/protobuf/BooleanArrayList;->modCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/google/protobuf/BooleanArrayList;->modCount:I

    .line 174
    return-void

    .line 160
    :cond_2
    iget v2, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x2

    add-int/lit8 v0, v2, 0x1

    .line 161
    .local v0, "length":I
    new-array v1, v0, [Z

    .line 164
    .local v1, "newArray":[Z
    iget-object v2, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    invoke-static {v2, v4, v1, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 167
    iget-object v2, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    add-int/lit8 v3, p1, 0x1

    iget v4, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    sub-int/2addr v4, p1

    invoke-static {v2, p1, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 168
    iput-object v1, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    goto :goto_0
.end method

.method public static emptyList()Lcom/google/protobuf/BooleanArrayList;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/google/protobuf/BooleanArrayList;->EMPTY_LIST:Lcom/google/protobuf/BooleanArrayList;

    return-object v0
.end method

.method private ensureIndexInRange(I)V
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 243
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    if-lt p1, v0, :cond_1

    .line 244
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p0, p1}, Lcom/google/protobuf/BooleanArrayList;->makeOutOfBoundsExceptionMessage(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 246
    :cond_1
    return-void
.end method

.method private makeOutOfBoundsExceptionMessage(I)Ljava/lang/String;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 249
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Index:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Size:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(ILjava/lang/Boolean;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Boolean;

    .prologue
    .line 135
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/protobuf/BooleanArrayList;->addBoolean(IZ)V

    .line 136
    return-void
.end method

.method public bridge synthetic add(ILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 45
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/BooleanArrayList;->add(ILjava/lang/Boolean;)V

    return-void
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Boolean;>;"
    const/4 v3, 0x0

    .line 178
    invoke-virtual {p0}, Lcom/google/protobuf/BooleanArrayList;->ensureIsMutable()V

    .line 180
    if-nez p1, :cond_0

    .line 181
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3

    .line 185
    :cond_0
    instance-of v4, p1, Lcom/google/protobuf/BooleanArrayList;

    if-nez v4, :cond_2

    .line 186
    invoke-super {p0, p1}, Lcom/google/protobuf/AbstractProtobufList;->addAll(Ljava/util/Collection;)Z

    move-result v3

    .line 208
    :cond_1
    :goto_0
    return v3

    :cond_2
    move-object v0, p1

    .line 189
    check-cast v0, Lcom/google/protobuf/BooleanArrayList;

    .line 190
    .local v0, "list":Lcom/google/protobuf/BooleanArrayList;
    iget v4, v0, Lcom/google/protobuf/BooleanArrayList;->size:I

    if-eqz v4, :cond_1

    .line 194
    const v4, 0x7fffffff

    iget v5, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    sub-int v2, v4, v5

    .line 195
    .local v2, "overflow":I
    iget v4, v0, Lcom/google/protobuf/BooleanArrayList;->size:I

    if-ge v2, v4, :cond_3

    .line 197
    new-instance v3, Ljava/lang/OutOfMemoryError;

    invoke-direct {v3}, Ljava/lang/OutOfMemoryError;-><init>()V

    throw v3

    .line 200
    :cond_3
    iget v4, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    iget v5, v0, Lcom/google/protobuf/BooleanArrayList;->size:I

    add-int v1, v4, v5

    .line 201
    .local v1, "newSize":I
    iget-object v4, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    array-length v4, v4

    if-le v1, v4, :cond_4

    .line 202
    iget-object v4, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    invoke-static {v4, v1}, Ljava/util/Arrays;->copyOf([ZI)[Z

    move-result-object v4

    iput-object v4, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    .line 205
    :cond_4
    iget-object v4, v0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    iget-object v5, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    iget v6, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    iget v7, v0, Lcom/google/protobuf/BooleanArrayList;->size:I

    invoke-static {v4, v3, v5, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 206
    iput v1, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    .line 207
    iget v3, p0, Lcom/google/protobuf/BooleanArrayList;->modCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/google/protobuf/BooleanArrayList;->modCount:I

    .line 208
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public addBoolean(Z)V
    .locals 1
    .param p1, "element"    # Z

    .prologue
    .line 143
    iget v0, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    invoke-direct {p0, v0, p1}, Lcom/google/protobuf/BooleanArrayList;->addBoolean(IZ)V

    .line 144
    return-void
.end method

.method public get(I)Ljava/lang/Boolean;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 105
    invoke-virtual {p0, p1}, Lcom/google/protobuf/BooleanArrayList;->getBoolean(I)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 45
    invoke-virtual {p0, p1}, Lcom/google/protobuf/BooleanArrayList;->get(I)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getBoolean(I)Z
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lcom/google/protobuf/BooleanArrayList;->ensureIndexInRange(I)V

    .line 111
    iget-object v0, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    aget-boolean v0, v0, p1

    return v0
.end method

.method public remove(I)Ljava/lang/Boolean;
    .locals 5
    .param p1, "index"    # I

    .prologue
    .line 227
    invoke-virtual {p0}, Lcom/google/protobuf/BooleanArrayList;->ensureIsMutable()V

    .line 228
    invoke-direct {p0, p1}, Lcom/google/protobuf/BooleanArrayList;->ensureIndexInRange(I)V

    .line 229
    iget-object v1, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    aget-boolean v0, v1, p1

    .line 230
    .local v0, "value":Z
    iget-object v1, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    add-int/lit8 v2, p1, 0x1

    iget-object v3, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    iget v4, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, v2, v3, p1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 231
    iget v1, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    .line 232
    iget v1, p0, Lcom/google/protobuf/BooleanArrayList;->modCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/protobuf/BooleanArrayList;->modCount:I

    .line 233
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method

.method public bridge synthetic remove(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 45
    invoke-virtual {p0, p1}, Lcom/google/protobuf/BooleanArrayList;->remove(I)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 213
    invoke-virtual {p0}, Lcom/google/protobuf/BooleanArrayList;->ensureIsMutable()V

    .line 214
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    if-ge v0, v1, :cond_1

    .line 215
    iget-object v1, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    aget-boolean v1, v1, v0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 216
    iget-object v1, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    add-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    iget v4, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    sub-int/2addr v4, v0

    invoke-static {v1, v2, v3, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 217
    iget v1, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    .line 218
    iget v1, p0, Lcom/google/protobuf/BooleanArrayList;->modCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/protobuf/BooleanArrayList;->modCount:I

    .line 219
    const/4 v1, 0x1

    .line 222
    :goto_1
    return v1

    .line 214
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 222
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public set(ILjava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Boolean;

    .prologue
    .line 121
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/BooleanArrayList;->setBoolean(IZ)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 45
    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2}, Lcom/google/protobuf/BooleanArrayList;->set(ILjava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public setBoolean(IZ)Z
    .locals 2
    .param p1, "index"    # I
    .param p2, "element"    # Z

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/google/protobuf/BooleanArrayList;->ensureIsMutable()V

    .line 127
    invoke-direct {p0, p1}, Lcom/google/protobuf/BooleanArrayList;->ensureIndexInRange(I)V

    .line 128
    iget-object v1, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    aget-boolean v0, v1, p1

    .line 129
    .local v0, "previousValue":Z
    iget-object v1, p0, Lcom/google/protobuf/BooleanArrayList;->array:[Z

    aput-boolean p2, v1, p1

    .line 130
    return v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 116
    iget v0, p0, Lcom/google/protobuf/BooleanArrayList;->size:I

    return v0
.end method
