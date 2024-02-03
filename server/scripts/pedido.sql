--INIT#salvarPedido#

INSERT INTO
    pedido
(idpedidostatus, idtipoentrega, idtaxaentrega, idformapagamento, troco, total, cep, endereco, numero, bairro, complemento, cidade, estado, nomecliente, telefonecliente)
    VALUES
(@idpedidostatus, @idtipoentrega, @idtaxaentrega, @idformapagamento, @troco, @total, @cep, @endereco, @numero, @bairro, @complemento, @cidade, @estado, @nomecliente, @telefonecliente)

--END#salvarPedido#


--INIT#salvarPedidoItem#

INSERT INTO
    pedidoitem
(idpedido, idproduto, quantidade, observacao)
    VALUES
(@idpedido, @idproduto, @quantidade, @observacao)

--END#salvarPedidoItem#


--INIT#salvarPedidoItemOpcional#

INSERT INTO
    pedidoitemopcional
(idpedidoitem, idopcionalitem)
    VALUES
(@idpedidoitem, @idopcionalitem)

--END#salvarPedidoItemOpcional#


--INIT#obterPedidoPorId#

SELECT
    p.idpedidostatus
    ,p.idpedidoincre
    , ps.descricao AS pedidostatus
    , p.idtipoentrega
    , p.idtaxaentrega
    , p.idformapagamento
    , fa.nome AS formapagamento
    , p.troco
    , p.total
    , p.cep
    , p.endereco
    , p.numero
    , p.bairro
    , p.complemento
    , p.cidade
    , p.estado
    , p.nomecliente
    , p.telefonecliente
    , p.datacadastro
    , te.valor AS taxaentrega
    , te.tempominimo AS entregatempominimo
    , te.tempomaximo AS entregatempomaximo
    , pi.idpedidoitem
    , pi.idproduto
    , pi.quantidade
    , pi.observacao
FROM
    pedido AS p
    JOIN pedidostatus AS ps ON ps.idpedidostatus = p.idpedidostatus
    JOIN formapagamento AS fa ON fa.idformapagamento = p.idformapagamento
    JOIN pedidoitem AS pi ON p.idpedido = pi.idpedido
    LEFT JOIN taxaentrega AS te ON te.idtaxaentrega = p.idtaxaentrega
WHERE
    p.idpedido = @idpedido

--END#obterPedidoPorId#

--INIT#listarTodas#
SELECT 
	p.idpedido,
    ps.descricao,
    te.nome as 'taxaEntrega',
    txet.nome as 'taxaEntregaTipo',
    fp.nome as 'formaPagamento',
    p.troco,
    p.total,
    p.cep,
    p.endereco,
    p.numero,
    p.bairro,
    p.complemento,
    p.cidade,
    p.estado,
    p.nomecliente,
    p.telefonecliente
FROM pedido p
INNER JOIN 
    pedidostatus ps on p.idpedidostatus = ps.idpedidostatus
INNER JOIN 
    tipoentrega  te on p.idtipoentrega = te.idtipoentrega
INNER JOIN 
    taxaentrega  txe on p.idtaxaentrega = txe.idtaxaentrega
INNER JOIN 
    taxaentregatipo  txet on txe.idtaxaentregatipo = txet.idtaxaentregatipo
INNER JOIN 
    formapagamento  fp on p.idformapagamento = fp.idformapagamento
WHERE
    p.idpedidostatus = @idpedidostatus
AND 
    DATE(P.datacadastro) = CURRENT_DATE()
ORDER BY 
    p.datacadastro DESC;

--END#listarTodas#


--INIT#moverStatus#

UPDATE
	pedido
SET
	idpedidostatus = @idstatus
WHERE
	idpedido = @idpedido

--END#moverStatus#